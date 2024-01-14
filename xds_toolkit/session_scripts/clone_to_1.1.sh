#!/bin/sh

# Script clones an exist 1.0 test session to something appropriate for 1.1 testing.
# Manual configuration will be required if an organization changes configuration parameters for their gateway.
#
# Arguments to script:
#       Session         The label of an existing test session
#                       Corresponds to exiting folders in:
#                          /opt/xdstools/external_cache/TestLogCache
#                          /opt/xdstools/external_cache/actors
#
# A testing session that exists with name xyz today will be cloned to xyz_1-1

# check_args
#  Check that the user passed exactly one argument to the script
#  Print an error message an exit if that is not true.

check_args() {
 if [ $# -ne 1 ] ; then
  echo "Script takes the label of one existing test session."
  echo "Zero or (> 1) label is not supported."
  echo "Script is exiting."
  exit 1
 fi
}


# check_existing_session()
#  Check that folders exist for what the user has specified as an
#  existing test session.
#  Print an error message and exit if either the TestLogCache or Actors folder
#  do not exist.
#  These errors imply the user entered an incorrect label or a problem with
#  the existing configuration.
#
# Arguments:
#             Existing test session
#             Base folder for Test Log Cache
#             Base folder for Actors

check_existing_session() {
 expected_folder="$2/$1"
 if [ ! -e "${expected_folder}" ] ; then
  echo Failed test for existing Test Log Cache folder: ${expected_folder}
  echo Script exits
  exit 1
 fi

 expected_actors_folder="$3/$1"
 if [ ! -e "${expected_folder}" ] ; then
  echo Failed test for existing Actors folder: ${expected_folder}
  echo Script exits
  exit 1
 fi
}

# screen_for_folder_conflicts()
# Ensure that this script will not try to create folders that already exist.
# We do not want to overwrite existing folders/data.
# Print an error message and exit if either the TestLogCache or Actors folder
# already exists.
#
# Arguments:
#             Proposed test session
#             Base folder for Test Log Cache
#             Base folder for Actors

screen_for_folder_conflicts() {
 expected_folder="$2/$1"
 if [ -e "${expected_folder}" ] ; then
  echo Test Log Cache folder already exists: ${expected_folder}
  echo Script exits
  exit 1
 fi

 expected_actors_folder="$3/$1"
 if [ -e "${expected_folder}" ] ; then
  echo Actors folder already exists: ${expected_folder}
  echo Script exits
  exit 1
 fi
}

# create_new_session()
# This function performs the work of creating the folders/files needed
# for a cloned test session.
# It assumes that the input test session does exist and that the folders needed
# for the new test session do not yet exist.
#
# Arguments:
#             Existing test session
#             New test session
#             Base folder for Test Log Cache
#             Base folder for Actors

create_new_session() {
 existing_test_log_cache_folder="$3/$1"
 new_test_log_cache_folder="$3/$2"
 sudo -u tomcat8 mkdir "${new_test_log_cache_folder}"

 if [ -e "${existing_test_log_cache_folder}/site.txt" ] ; then
  cp -p "${existing_test_log_cache_folder}/site.txt" "${new_test_log_cache_folder}"
 fi

 existing_actors_folder="$4/$1"
 new_actors_folder="$4/$2"

 cp -rp "${existing_actors_folder}" /tmp
 mv "/tmp/$1" "${new_actors_folder}"

 for actor_file in "${new_actors_folder}"/* ; do
  echo $actor_file
  sed -i -e "s/owner=\"$1/owner=\"$2/" $actor_file
 done
}

check_args $*

EXISTING_TEST_SESSION=$1
TEST_LOG_CACHE=/opt/xdstools/external_cache/TestLogCache
ACTORS_FOLDER=/opt/xdstools/external_cache/actors
NEW_SESSION_SUFFIX="_1-1"

new_session="$EXISTING_TEST_SESSION$NEW_SESSION_SUFFIX"

set -e

check_existing_session      "$EXISTING_TEST_SESSION"                $TEST_LOG_CACHE $ACTORS_FOLDER
screen_for_folder_conflicts "$new_session"                          $TEST_LOG_CACHE $ACTORS_FOLDER

create_new_session          "$EXISTING_TEST_SESSION" "$new_session" $TEST_LOG_CACHE $ACTORS_FOLDER

ls -ld         "$TEST_LOG_CACHE/$new_session"
echo ""
ls -ld         "$ACTORS_FOLDER/$new_session"
ls -l          "$ACTORS_FOLDER/$new_session"
grep -r owner  "$ACTORS_FOLDER/$new_session"
