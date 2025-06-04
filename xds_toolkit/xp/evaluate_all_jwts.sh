#!/bin/sh

# Script 

source `dirname $0`/../core/common.sh

# Arguments:
#             Output folder

BASE=`dirname $0`/..

OUTPUT_FOLDER=$1

for folder in $OUTPUT_FOLDER/* ; do
 if [ -f $folder ] ; then
  echo skip file: $folder
  continue
 fi
 file_label=`basename $folder`

 
 JWT=$folder/id_token.jwt
 HEADER=$folder/header.json
 PAYLOAD=$folder/payload.json
 RULES=$BASE/rules/QTFTEST-002.jwt.txt
 OUTPUT=$folder/jwt_evaluation.txt
 echo $BASE/jwt/evaluate_jwt.sh $JWT $HEADER $PAYLOAD $RULES   $OUTPUT
      $BASE/jwt/evaluate_jwt.sh $JWT $HEADER $PAYLOAD $RULES > $OUTPUT

done

