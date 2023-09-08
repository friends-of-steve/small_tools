#!/bin/sh

FOLDER=$1
EXTENSION=$2


find $FOLDER -type f -exec mv {} {}$EXTENSION \;



