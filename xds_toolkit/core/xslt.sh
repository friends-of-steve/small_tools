#!/bin/bash

# Apply XSLT to one file
# Output is written to a file or stdout

print_usage_and_die() {
 echo "
Arguments: Input XML file
           XSLT file
           [Output file]"
 exit 1
}

# Check that the arguments are given and make sense
#       Input XML file
#       XSLT file
#       [Output file]

check_args () {
 if [ $# -lt 2 ] ; then
  print_usage_and_die
 fi

 if [ ! -e $1 ] ; then
  echo "$1 should reference input XML file"
  print_usage_and_die
 fi

 if [ ! -e $2 ] ; then
  echo "$1 should reference XSL file"
  print_usage_and_die
 fi
}

# Arguments:  Input XML File
#             XSLT file
#             [Output file]

## Main starts here

set -e

check_args $*

INPUT_XML="$1"
XSLT_FILE="$2"

BASE_FOLDER=`dirname $0`
SAXON="$BASE_FOLDER/../../lib/Saxon-HE-9.9.1-8.jar"

if [ $# -lt 3 ] ; then
 java -jar $SAXON -s:$INPUT_XML -xsl:$XSLT_FILE
else
 java -jar $SAXON -s:$INPUT_XML -xsl:$XSLT_FILE > $3
fi
