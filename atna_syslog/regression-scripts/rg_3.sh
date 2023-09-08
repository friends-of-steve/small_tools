#!/bin/sh

./scripts/syslog_master_1.sh regression-data/ITI-80*good*xml

ls -l /tmp/index.csv /tmp/minimal.csv

#open /tmp/index.csv /tmp/minimal.csv
