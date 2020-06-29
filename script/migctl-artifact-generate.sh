#!/usr/bin/env bash

if [ $# -ne 1 ]; then
  echo "migctl-artifact-generate.sh <MIGRATION_NAME>" 1>&2
  exit 1
fi

migctl migration generate-artifacts $1

while true
do
sleep 10
migctl migration status $1
done