#!/bin/sh

XSLT=xslt/Audit_to_CSV.xsl
SAXON=lib/Saxon-HE-9.9.1-8.jar

rm  -f /tmp/syslog.csv; touch  /tmp/syslog.csv

for FILE in $* ; do
 echo $FILE
 java -jar $SAXON -s:$FILE -xsl:$XSLT >> /tmp/syslog.csv
done
