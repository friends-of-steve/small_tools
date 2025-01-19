#!/bin/bash

# Iterate through the transactions of one Toolkit simulator
# and apply one XSLT to each request_body.txt that is found.
# Output is written to a separate file for each request_body.txt found.

print_usage_and_die() {
 echo "
Arguments: SIMDB Actor folder (external_cache/simdb/test_session/community/actor
           Transaction (xcq, xcr, ...)
           XSLT file
           Output folder"
 exit 1

}

# Check that the arguments are given and make sense
#       SIMDB Actor folder (external_cache/simdb/test_session/community/actor
#       Transaction (xcq, xcr, ...)
#       XSLT File
#       Output folder

check_args () {
 if [ $# -lt 4 ] ; then
  print_usage_and_die
 fi

 if [ ! -e "$1" ] ; then
  echo "$1 should reference simdb actor folder"
  print_usage_and_die
 fi

 if [ ! -e "$1/$2" ] ; then
  echo "$1 should reference transaction folder (xcq, xcr, ...)"
  print_usage_and_die
 fi

 if [ ! -e "$3" ] ; then
  echo "$3 should reference XSLT file"
  print_usage_and_die
 fi

 # No test for output folder.
 # We will create it if we need it
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
  cp $2 $3
 fi
}

# Arguments
#            SIMDB Actor folder (external_cache/simdb/test_session/community/actor
#            Transaction (xcq, xcr, ...)
#            XSLT file
#            Output folder"

## Main starts here

set -e

check_args $*

SIMDB_FOLDER="$1"
TRANSACTION=$2
XSLT="$3"
OUTPUT_FOLDER="$4"

TRANSACTION_FOLDER="$SIMDB_FOLDER/$TRANSACTION"

echo $SIMDB_FOLDER
ls   $SIMDB_FOLDER
echo $TRANSACTION_FOLDER
ls   $TRANSACTION_FOLDER

BASE_FOLDER=`dirname $0`
SAXON="$BASE_FOLDER/../../lib/Saxon-HE-9.9.1-8.jar"

mkdir -p $OUTPUT_FOLDER

for folder in $TRANSACTION_FOLDER/* ; do
 time_stamp=`basename $folder`
 request_file=$folder/request_body.txt
 echo $request_file
 tmp_file=/tmp/request_body.txt

 echo preprocess_request $TRANSACTION $folder/request_body.txt $tmp_file
      preprocess_request $TRANSACTION $folder/request_body.txt $tmp_file

 echo "$BASE_FOLDER/xslt.sh" $tmp_file $XSLT $OUTPUT_FOLDER/$time_stamp.$TRANSACTION.txt
      "$BASE_FOLDER/xslt.sh" $tmp_file $XSLT $OUTPUT_FOLDER/$time_stamp.$TRANSACTION.txt
done

