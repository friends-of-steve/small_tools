#!/bin/sh

./scripts/syslog_master_1.sh /opt/test-data/RG_MessageDelivery/RG*txt

ls -l /tmp/index.csv /tmp/minimal.csv

open /tmp/index.csv /tmp/minimal.csv
