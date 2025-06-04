#!/bin/bash

# Args:
#       JSON header
#       JSON payload
#       Output CSV

HEADER=$1
PAYLOAD=$2
OUTPUT=$3

TAB="	"

# Print the header row and exit
if [ $# -eq 0 ] ; then
 output_string="path	"
 for field in alg typ kid ; do
  output_string="${output_string}${field}${TAB}"
 done

 for field in	\
    aud iat iss jti given_name family_name email email_verified birthdate SSN Gender	\
    address.formatted   address.street_address address.locality 	\
    address.regionality address.postal_code    address.country 	\
   ; do
  output_string="${output_string}${field}${TAB}"
 done

 echo "$output_string"
 exit 0
fi

# This is the section where we extract from the files

output_string=""
for field in alg typ kid ; do
  extract=`jq -r ".$field" $HEADER`
  output_string="${output_string}${extract}${TAB}"
done

for field in	\
    aud iat iss jti given_name family_name email email_verified birthdate SSN Gender	\
    address.formatted   address.street_address address.locality 	\
    address.regionality address.postal_code    address.country 	\
   ; do
  extract=`jq -r ".$field" $PAYLOAD`
  output_string="${output_string}${extract}${TAB}"
done

echo "$output_string" > $OUTPUT

cat $OUTPUT
