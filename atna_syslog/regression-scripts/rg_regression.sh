#!/bin/sh

set -e

rm -rf regression-tmp; mkdir -p regression-tmp

#./scripts/event_identification.sh regression-data/*RG-synthetic*xml
#mv /tmp/EventIdentification.csv regression-tmp/RG.EventIdentification.csv

#./scripts/source.sh regression-data/*RG-synthetic*xml
#mv /tmp/Source.csv regression-tmp/RG.Source.csv

#./scripts/destination.sh regression-data/*RG-synthetic*xml
#mv /tmp/Destination.csv regression-tmp/RG.Destination.csv

#./scripts/auditsource.sh regression-data/*RG-synthetic*xml
#mv /tmp/AuditSource.csv regression-tmp/RG.AuditSource.csv

./scripts/participantobject_identification.sh regression-data/*RG-synthetic*xml
mv /tmp/ParticipantObject.csv regression-tmp/RG.ParticipantObject.csv
