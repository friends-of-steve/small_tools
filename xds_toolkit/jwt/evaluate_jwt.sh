#!/bin/bash

# Arguments
#           Type (header / payload / jwt)
#           Path to jwt file
#           Path to header.json
#           Path to payload.json
#           key that identifies the value to get

get_value() {

  rtn_value="$1"
  if [ $1 == "header" ] ; then
    rtn_value=`jq -r "$5" $3`
  elif [ $1 == "payload" ] ; then
    rtn_value=`jq -r "$5" $4`
  elif [ $1 == "jwt" ] ; then
    rtn_value="JWZt"
  else
    echo get_value function does not understand this value for type: $0
    return
  fi
 
  echo $rtn_value
}

# Args
#       key
#       extracted_value
#       parameter
#       log file
execute_eq() {
  if [ "$2" == "$3" ] ; then
    echo TRUE $1: == "$2 / $3" >> $4
    echo 0
  else
    echo ERROR $1: "$2 != $3" >> $4
    echo 1
  fi
}

# Args
#       key
#       extracted_value
#       parameter
#       log file
execute_notEmpty() {
  if [ "$2" != "" ] ; then
    echo TRUE $1: notEmpty "$2" >> $4
    echo 0
  else
    echo ERROR $1: "$2" is empty >> $4
    echo 1
  fi
}

# Args
#       key
#       extracted_value
#       parameter
#       log file
execute_startsWith() {
  pattern="$3*"
  if [[ "$2" == $pattern ]] ; then
    echo TRUE $1: startsWith "$2" / $3 >> $4
    echo 0
  else
    echo ERROR $1: "$2" does not start with $3 >> $4
    echo 1
  fi
}

# Args
#       operation
#       key
#       extracted_value
#       parameter
#       log file
execute_op() {
  if [ "$1" == "eq" ] ; then
    execute_eq $2 "$3" "$4" "$5"
  elif [ "$1" == "notEmpty" ] ; then
    execute_notEmpty $2 "$3" "$4" "$5"
  elif [ "$1" == "startsWith" ] ; then
    execute_startsWith $2 "$3" "$4" "$5"
  else
    echo "ERROR Unrecognized operation: $1 with parameters $2 $3 $4" >> $5
    echo 1
  fi
}

## Main starts here

# Arguments:
#            path to jwt itself
#            path to header.json
#            path to payload.json
#            path to rules file

JWT=$1
HEADER=$2
PAYLOAD=$3
RULES=$4

LOG=/tmp/$$.txt
echo $* > $LOG

error_status=0
while IFS='	'  read -a rule ; do
  # Type, JWT Key, Operation, Validation Parameter
       type="${rule[0]}"
    jwt_key="${rule[1]}"
  operation="${rule[2]}"
  parameter="${rule[3]}"

  extracted_value=$( get_value ${type} $JWT $HEADER $PAYLOAD ${jwt_key})
  result=$( execute_op "$operation" "$jwt_key" "$extracted_value" "$parameter" $LOG )
  
  error_status=$(( $error_status | $result ))

done < $RULES

echo ""
cat $LOG
echo Error Status $error_status
exit $error_status

