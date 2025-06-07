#!/bin/bash

check_usage() {

  if [ $# -eq 0 ] ; then
    echo "Usage: [-c community] [-o folder] test_session"
    exit 1
  fi
}

# Extract request_body.txt files from Toolkit SIMDB folders
# Arguments:
#         [ -c community ]; defaults to community1
#         [ -o folder ] ; output defaults to simdb/$session/$community/rq/xcq
#         Test Session

source `dirname $0`/../core/common.sh

ACTOR=rg
TRANSACTION=xcq

POSITIONAL_ARGS=()

community="community1"
output_folder=""

while [[ $# -gt 0 ]]; do
  case $1 in
    -c|--community)
      community="$2"
      shift # past argument
      shift # past value
      ;;
    -o|--output)
      output_folder="$2"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters
check_usage $*

test_session=$1

if [ "$output_folder" == "" ] ; then
  output_folder=`dirname $0`/../simdb/$test_session/$community/$ACTOR
fi

SIMDB=$TOOLKIT_CACHE/simdb/$test_session/$test_session"__"$community/$ACTOR

if [ ! -d $SIMDB ] ; then
  echo Toolkit simulator folder not found: $SIMDB
  exit 1
fi

echo mkdir -p $output_folder
     mkdir -p $output_folder

echo `dirname $0`/../core/extract_request_body_files.sh $SIMDB $TRANSACTION $output_folder
     `dirname $0`/../core/extract_request_body_files.sh $SIMDB $TRANSACTION $output_folder

