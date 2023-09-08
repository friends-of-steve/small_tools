#!/bin/sh

set -e

rm -rf regression-tmp; mkdir -p regression-tmp

./scripts/event_identification.sh regression-data/*IG-synthetic*xml
mv /tmp/EventIdentification.csv regression-tmp/IG.EventIdentification.csv

./scripts/source.sh regression-data/*IG-synthetic*xml
mv /tmp/Source.csv regression-tmp/IG.Source.csv

./scripts/destination.sh regression-data/*IG-synthetic*xml
mv /tmp/Destination.csv regression-tmp/IG.Destination.csv

./scripts/auditsource.sh regression-data/*IG-synthetic*xml
mv /tmp/AuditSource.csv regression-tmp/IG.AuditSource.csv
