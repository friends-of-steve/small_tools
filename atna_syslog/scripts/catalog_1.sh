#!/bin/sh

XSLT=xslt/Audit_to_Code_Values.xsl
SAXON=lib/Saxon-HE-9.9.1-8.jar
TAB="\t"

rm -f /tmp/syslog.csv; touch /tmp/syslog.csv

for FILE in $* ; do
 echo $FILE
 XSLT_OUT=`java -jar $SAXON -s:$FILE -xsl:$XSLT`
 echo $FILE$TAB$XSLT_OUT >> /tmp/syslog.csv
done
