#!/bin/sh

set -e

rm -rf regression-tmp; mkdir -p regression-tmp

MANIFEST="
regression-data/ITI-38-IG-synthetic-01.xml
regression-data/ITI-38-RG-synthetic-01.xml
regression-data/ITI-39-IG-synthetic-01.xml
regression-data/ITI-39-RG-synthetic-01.xml
regression-data/ITI-55-IG-synthetic-01.xml
regression-data/ITI-55-RG-synthetic-01.xml
regression-data/ITI-80-IG-synthetic-01.xml
regression-data/ITI-80-RG-synthetic-01.xml"

./scripts/event_identification.sh $MANIFEST
mv /tmp/EventIdentification.csv regression-tmp/EventIdentification.csv
open regression-tmp/EventIdentification.csv

./scripts/source.sh $MANIFEST
mv /tmp/Source.csv regression-tmp/Source.csv
open regression-tmp/Source.csv

./scripts/destination.sh $MANIFEST
mv /tmp/Destination.csv regression-tmp/Destination.csv
open regression-tmp/Destination.csv

./scripts/auditsource.sh $MANIFEST
mv /tmp/AuditSource.csv regression-tmp/AuditSource.csv
open regression-tmp/AuditSource.csv

./scripts/humanrequestor.sh $MANIFEST
mv /tmp/HumanRequestor.csv regression-tmp/HumanRequestor.csv
open regression-tmp/HumanRequestor.csv

./scripts/patient.sh $MANIFEST
mv /tmp/Patient.csv regression-tmp/Patient.csv
open regression-tmp/Patient.csv

./scripts/payload.sh $MANIFEST
mv /tmp/Payload.csv regression-tmp/Payload.csv
open regression-tmp/Payload.csv

#./scripts/participantobject_identification.sh $MANIFEST
#mv /tmp/ParticipantObject.csv regression-tmp/ParticipantObject.csv
#open regression-tmp/ParticipantObject.csv
