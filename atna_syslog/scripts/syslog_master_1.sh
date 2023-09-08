#!/bin/sh

# This script reads a set of ATNA syslog files named on the
# command line. It produces output files in the tmp folder.

## Main starts here


XSLT=xslt/Audit_to_Code_Values.xsl
XSLT_MIN=xslt/Audit_minimal.xsl
TEXT_MIN=xslt/Audit_minimal.txt

SAXON=lib/Saxon-HE-9.9.1-8.jar
TAB="\t"

rm -f /tmp/syslog.csv; touch /tmp/syslog.csv
cp $TEXT_MIN /tmp/minimal.csv

for FILE in $* ; do
 echo $FILE
 # Append to CSV file that maps the input file to a string that identifies the transaction/role
 XSLT_OUT=`java -jar $SAXON -s:$FILE -xsl:$XSLT`
 echo $FILE$TAB$XSLT_OUT >> /tmp/syslog.csv

 # Append to CSV file that extracts minimal elements for user review
 XSLT_OUT=`java -jar $SAXON -s:$FILE -xsl:$XSLT_MIN`
 echo $FILE$TAB"$XSLT_OUT" >> /tmp/minimal.csv


done

perl scripts/catalog.pl /tmp/syslog.csv etc/catalog_codes.txt > /tmp/index.csv
#perl scripts/evs_val.pl /tmp/syslog.csv etc/catalog_codes.txt > /tmp/evs_output.csv

echo perl scripts/evs_val.pl /tmp/syslog.csv etc/catalog_codes.txt 
