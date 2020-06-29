#!/usr/bin/env bash

if [ $# -ne 2 ]; then
  echo "migctl-source-crate.sh <MIGRATION_NAME> <VM_INSTANCE_NAME>" 1>&2
  exit 1
fi
migctl migration create $1 \
  --source vm-source \
  --vm-id $2 --intent Image
