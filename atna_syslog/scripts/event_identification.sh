#!/bin/sh

# This script reads a set of ATNA syslog files named on the
# command line. It produces output files in the tmp folder.

## Main starts here


XSLT_EVENT=xslt/Audit_EventIdentification.xsl
TEXT_EVENT=xslt/Audit_EventIdentification.txt

SAXON=lib/Saxon-HE-9.9.1-8.jar
TAB="\t"

cp $TEXT_EVENT /tmp/EventIdentification.csv

for FILE in $* ; do
 echo $FILE

 # Append to CSV file that extracts minimal elements for user review
 XSLT_OUT=`java -jar $SAXON -s:$FILE -xsl:$XSLT_EVENT`
 echo $FILE$TAB"$XSLT_OUT" >> /tmp/EventIdentification.csv


done

#perl scripts/catalog.pl /tmp/syslog.csv etc/catalog_codes.txt > /tmp/index.csv
#perl scripts/evs_val.pl /tmp/syslog.csv etc/catalog_codes.txt > /tmp/evs_output.csv

#echo perl scripts/evs_val.pl /tmp/syslog.csv etc/catalog_codes.txt 
