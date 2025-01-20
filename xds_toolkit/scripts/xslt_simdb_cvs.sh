#!/bin/bash

# Iterate through the transactions of one Toolkit simulator
# and apply one XSLT to each request_body.txt that is found.
# Output is written to one file.
# This is the CVS model.

print_usage_and_die() {
 echo "
Arguments: SIMDB Actor folder (external_cache/simdb/test_session/community/actor
           Transaction (xcq, xcr, ...)
           Header file (use /dev/null if no header)
           XSLT file
           [Output file]"
 exit 1

}

# Check that the arguments are given and make sense
#       SIMDB Actor folder (external_cache/simdb/test_session/community/actor
#       Transaction (xcq, xcr, ...)
#       Header file (use /dev/null if no header)
#       XSLT file
#       [Output file]"

check_args () {
 if [ $# -lt 4 ] ; then
  print_usage_and_die
 fi

 if [ ! -e $1 ] ; then
  echo "$1 should reference simdb actor folder"
  print_usage_and_die
 fi

 if [ ! -e "$1/$2" ] ; then
  echo "$1/$2 should reference transaction folder (xcq, xcr, ...)"
  print_usage_and_die
 fi

 if [ ! -e "$3" ] ; then
  echo "$3 should reference a header file; it can be /dev/null"
  print_usage_and_die
 fi

 if [ ! -e "$4" ] ; then
  echo "$4 should reference thee XSLT file"
  print_usage_and_die
 fi

 # No test for the optional output file name
}

# Arguments:  Transaction
#             Input file
#             Output file
preprocess_request () {
 if [ "$1" == "xcr" ] ; then
  # This is an ugly way to strip off what we don't want
  echo WARN: preprocess_request strips non-XML with a poor/lazy mechanism
  cat $2 | sed -e 's/\r//g'	\
         | grep -v		\
        -e "^--MIMEBoundary"	\
        -e "^Content-"		\
        -e "^$"			\
        -e "^ *$"		\
    > $3
 else
  cp $2 /tmp/request.xml
 fi
}

# Arguments
#            SIMDB Actor folder (external_cache/simdb/test_session/community/actor
#            Transaction (xcq, xcr, ...)
#            Header file (use /dev/null if no header)
#            XSLT file
#            [Output file]

## Main starts here

set -e

check_args $*

SIMDB_FOLDER="$1"
TRANSACTION=$2
HEADER_FILE="$3"
XSLT="$4"

TRANSACTION_FOLDER="$SIMDB_FOLDER/$TRANSACTION"
if [ "$5" == "" ] ; then
 OUTPUT=/tmp/cvs.txt
else
 OUTPUT="$5"
fi

echo $SIMDB_FOLDER
ls   $SIMDB_FOLDER
echo $TRANSACTION_FOLDER
ls   $TRANSACTION_FOLDER

BASE_FOLDER="`dirname $0`""/.."
SAXON="$BASE_FOLDER/../lib/Saxon-HE-9.9.1-8.jar"
TAB="\t"

cp $HEADER_FILE $OUTPUT

for folder in $TRANSACTION_FOLDER/* ; do
 request_file=$folder/request_body.txt
 echo $request_file

 tmp_file=/tmp/request.xml
 echo preprocess_request $TRANSACTION $request_file $tmp_file
      preprocess_request $TRANSACTION $request_file $tmp_file

 # Append to CSV file that extracts elements for review
 echo      java -jar $SAXON -s:$tmp_file -xsl:$XSLT
 XSLT_OUT=`java -jar $SAXON -s:$tmp_file -xsl:$XSLT`
 echo -e "$request_file$TAB$XSLT_OUT" >> $OUTPUT
 echo -e "$request_file$TAB$XSLT_OUT"
done

ls -l $OUTPUT

