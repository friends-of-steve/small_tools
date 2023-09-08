#!/usr/bin/perl

use strict;
use warnings;

use HTTP::Request () ;
use HTTP::Response () ;
use LWP::UserAgent;
use MIME::Base64;

#use WWW::Curl;
#use REST::Client;

sub readFile {
 my ($path_to_file) = @_;

 open my $handle, '<', $path_to_file;
 chomp(my @lines = <$handle>);
 close $handle;
 return @lines;
}

sub writeFile {
 my ($path_to_file, $output) = @_;

 open my $handle, '>', $path_to_file or die "Could not create output file: $path_to_file\n";

 print $handle $output;
 close $handle;

 print "Write to file complete: $path_to_file\n";
}

sub readFileAsString {
 my ($path_to_file) = @_;
 open my $fh, '<', $path_to_file or die "Can't open file $!";
 my $file_content = do { local $/; <$fh> };

 return $file_content;
}

sub readCodeHash {
 my ($path_to_file) = @_;

 my @lines = readFile($path_to_file);
 my %h;
 foreach my $line (@lines) {
  my @tokens = split '\t', $line;
  if (defined $tokens[1]) {
    $h{$tokens[0]} = $tokens[1];
  }
 }
 return %h;
}

sub producePayload {
 my ($file, $name, $validator) = @_;

 my $original_text = readFileAsString($file);
 my $encoded_text  = encode_base64($original_text);

 my $payload =
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" .
    "<validation xmlns=\"http://evsobjects.gazelle.ihe.net/\">\n" .
    "    <validationService xmlns=\"http://evsobjects.gazelle.ihe.net/\" name=\"$name\" validator=\"$validator\"/>\n" .
    "    <object xmlns=\"http://evsobjects.gazelle.ihe.net/\" originalFileName=\"$file\">\n"  .
    "      <content>$encoded_text</content>\n" .
    "    </object>\n" .
    "</validation>\n" ;

 return $payload;
}

sub processLine {
 my ($base_url, $line, %h) = @_;

 my ($file, $label) = split '\t', $line;
 my $output_file = $file . ".report.xml";

 my $validator = $h{$label};
 die "No validator for <$label>\n" if (! defined $validator);

 my $payload = producePayload($file, "GSS - Audit Message Validator", $validator);

 my $ua = LWP::UserAgent->new();
 my $response = $ua->post($base_url, Content_Type => 'application/xml', Content => $payload);
 if (! $response->is_success) {
    print STDERR $response->status_line, "\n";
    print $response->decoded_content;
    return; 
 }
 my $report_url = $response->header("X-Validation-Report-Redirect");
 my $report_xml = $ua->get($report_url, Accept => 'application/gzl.validation.report+xml');
 if ($response->is_success) {
  writeFile($output_file, $report_xml->content);
 } else {
  print STDERR "Did not retrieve report: $report_url\n";
  print $response->code;
  print $response->decoded_content;
 }
}


my @input_lines = readFile($ARGV[0]);
my %code_hash   = readCodeHash($ARGV[1]);

#my $client = REST::Client->new();
my $url= "https://gazelle.ihe.net/evs/rest/validations";

foreach my $line(@input_lines) {
 processLine($url, $line, %code_hash);
}
