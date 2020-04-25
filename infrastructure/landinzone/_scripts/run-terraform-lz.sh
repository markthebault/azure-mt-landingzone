#!/bin/bash
set -e
BASEDIR=$(dirname "$0")


for dir in $(ls -d ${BASEDIR}/../tflz_*/); do
    cd "$dir";
    #terraform validate --check-variables=false;
    cat terraform.tfvars.json | jq
    cd -;
done