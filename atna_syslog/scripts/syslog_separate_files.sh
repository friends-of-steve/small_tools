#!/bin/sh

# This script reads a set of ATNA syslog files named on the
# command line.
# It determines the type of message based on content copies
# the files into separate folders. This is one aspect of
# making a catalog of the files.
# Arguments:
#             Base output folder
#             Input file [input file ....]

## Main starts here


XSLT=xslt/Audit_to_Code_Values.xsl

SAXON=lib/Saxon-HE-9.9.1-8.jar
TAB="\t"

rm -f /tmp/syslog.csv; touch /tmp/syslog.csv

BASE_OUTPUT=$1
XML=.xml
shift

for FILE in $* ; do
 echo "$FILE"
 BASENAME=`basename ${FILE}`
 echo $BASENAME

 XSLT_OUT=`java -jar $SAXON "-s:$FILE" -xsl:$XSLT`
 echo $FILE$TAB$XSLT_OUT 
 FOLDER=`perl scripts/hash_lookup.pl "$XSLT_OUT" etc/syslog_code_to_folder.txt`
 if [ $? -ne 0 ] ; then FOLDER=defective; fi
 echo "  " $FOLDER

 mkdir -p $BASE_OUTPUT/$FOLDER
 cp -p "$FILE" "${BASE_OUTPUT}/${FOLDER}"

done

#find "$BASE_OUTPUT" -type f -exec ls -l {} \;

#perl scripts/catalog.pl /tmp/syslog.csv etc/catalog_codes.txt > /tmp/index.csv
#perl scripts/evs_val.pl /tmp/syslog.csv etc/catalog_codes.txt > /tmp/evs_output.csv
