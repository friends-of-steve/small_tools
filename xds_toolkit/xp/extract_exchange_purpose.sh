#!/bin/bash

source `dirname $0`/../core/common.sh

# Arguments:
#             Output folder

BASE=`dirname $0`/..
XSLT=$BASE/xslt/exchange_purpose.xsl
HEADER=$BASE/xslt/exchange_purpose.txt

OUTPUT_FOLDER=$1
SUMMARY=$OUTPUT_FOLDER/exchange_purpose_summary.txt

cp $HEADER $SUMMARY

for folder in $OUTPUT_FOLDER/* ; do
 if [ -f $folder ] ; then
  echo skip file: $folder
  continue
 fi
 file_label=`basename $folder`
 echo $BASE/core/xslt.sh $folder/request.xml $XSLT $folder/exchange_purpose.txt
      $BASE/core/xslt.sh $folder/request.xml $XSLT $folder/exchange_purpose.txt
      cat $folder/exchange_purpose.txt | sed -e "s/^/$file_label	/" >> $SUMMARY
done

