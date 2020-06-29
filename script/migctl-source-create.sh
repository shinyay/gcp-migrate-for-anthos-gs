#!/usr/bin/env bash

if [ $# -ne 1 ]; then
  echo "migctl-source-crate.sh <ZONE>" 1>&2
  exit 1
fi
migctl source create ce vm-source --project $(gcloud config get-value project) --zone $1
