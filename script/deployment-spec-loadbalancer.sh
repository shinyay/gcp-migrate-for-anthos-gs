#!/usr/bin/env bash

if [ $# -ne 2 ]; then
  echo "deployment-spec-loadbalancer.sh <SERVICE_NAME> <APP_LABEL_NAME>" 1>&2
  exit 1
fi

cat - << EOS >> deployment_spec.yaml

apiVersion: v1
kind: Service
metadata:
  name: $1
spec:
  selector:
    app: $2
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: LoadBalancer
EOS
