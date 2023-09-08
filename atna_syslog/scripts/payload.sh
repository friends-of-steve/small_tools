#!/bin/sh

# This script reads a set of ATNA syslog files named on the
# command line. It produces output files in the tmp folder.

## Main starts here


XSLT_EVENT=xslt/Audit_Payload.xsl
TEXT_EVENT=xslt/Audit_Payload.txt
OUTPUT=/tmp/Payload.csv

# Everything below here is standard

SAXON=lib/Saxon-HE-9.9.1-8.jar
TAB="\t"

cp $TEXT_EVENT $OUTPUT

for FILE in $* ; do
 echo $FILE

 # Append to CSV file that extracts minimal elements for user review
 XSLT_OUT=`java -jar $SAXON -s:$FILE -xsl:$XSLT_EVENT`
 echo $FILE$TAB"$XSLT_OUT" >> $OUTPUT
done

