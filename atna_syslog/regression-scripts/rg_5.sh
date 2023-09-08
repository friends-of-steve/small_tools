#!/bin/sh

rm -rf regression-tmp

./scripts/syslog_separate_files.sh regression-tmp regression-data/ITI-39-IG*d-01.xml

exit 0

./scripts/syslog_master_1.sh regression-tmp/*/[IR]G/*xml
#./scripts/syslog_master_1.sh regression-tmp/*/[IR]G/*80*xml
#./scripts/syslog_master_1.sh regression-tmp/*/[IR]G/*39*bad*xml

#perl scripts/evs_val.pl /tmp/syslog.csv etc/syslog_code_to_validator.txt


