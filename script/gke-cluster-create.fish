#!/usr/bin/env fish

function do_func
  argparse -n do_func 'h/help' 'r/region=' -- $argv
  or return 1

  if set -lq _flag_help
    echo "gke-cluster-create.fish -r/--region <REGION_NAME>"
    return
  end

  set -lq _flag_region
  or set -l _flag_region us-central1

  gcloud container clusters create migration-processing \
    --num-nodes 1 \
    --scopes "cloud-platform" \
    --project (gcloud config get-value project) \
    --zone $_flag_region-a \
    --machine-type n1-standard-4 \
    --image-type ubuntu \
    --enable-stackdriver-kubernetes

  gcloud container clusters get-credentials migration-processing \
    --zone $_flag_region-a \
    --project (gcloud config get-value project)
end

do_func $argv
