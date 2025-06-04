#!/bin/sh

# Script extracts ID token values from request.xml files.

source `dirname $0`/../core/common.sh

# Arguments:
#             Output folder

BASE=`dirname $0`/..
XSLT=$BASE/xslt/id_token.xsl

OUTPUT_FOLDER=$1

SUMMARY=$OUTPUT_FOLDER/jwt_fields_summary.txt
echo $BASE/core/extract_jwt_fields.sh
     $BASE/core/extract_jwt_fields.sh > $SUMMARY

for folder in $OUTPUT_FOLDER/* ; do
 if [ -f $folder ] ; then
  echo skip file: $folder
  continue
 fi
 file_label=`basename $folder`

 echo $BASE/core/xslt.sh $folder/request.xml $XSLT $folder/id_token.jwt
      $BASE/core/xslt.sh $folder/request.xml $XSLT $folder/id_token.jwt

 echo $PYTHON3 $BASE/core/print_jwt.py $folder/id_token.jwt $folder/header.json $folder/payload.json
      $PYTHON3 $BASE/core/print_jwt.py $folder/id_token.jwt $folder/header.json $folder/payload.json

 echo $BASE/core/extract_jwt_fields.sh $folder/header.json $folder/payload.json $folder/jwt_fields.txt
      $BASE/core/extract_jwt_fields.sh $folder/header.json $folder/payload.json $folder/jwt_fields.txt

      cat $folder/jwt_fields.txt | sed -e "s/^/$file_label	/" >> $SUMMARY
done

