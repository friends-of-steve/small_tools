#!/usr/bin/perl

sub readFile {
 my ($path_to_file) = @_;

 open my $handle, '<', $path_to_file;
 chomp(my @lines = <$handle>);
 close $handle;
 return @lines;
}

sub readCodeHash {
 my ($path_to_file) = @_;

 my @lines = readFile($path_to_file);
 my %h;
 foreach my $line (@lines) {
  my @tokens = split '\t', $line;
  $h{$tokens[0]} = $tokens[1];
 }
 return %h;
}

sub processLine {
 my ($line, %h) = @_;

 my @tokens = split '\t', $line;

 my $label = $h{$tokens[1]};
 my $TAB="\t";
 print "$tokens[0]" . $TAB . "$tokens[1]" . $TAB . "$label\n";
}


my @input_lines = readFile($ARGV[0]);
my %code_hash   = readCodeHash($ARGV[1]);

foreach my $line(@input_lines) {
 processLine($line, %code_hash);
}
