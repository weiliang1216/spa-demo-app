#!/bin/bash

#
# usage sample: 
# ./buildHelper.sh v1.1
#

set -ex

TAG="${1}"
REGISTRY="weiliang1216"

bp () {
    docker build -t ${REGISTRY}/${1}:${TAG} -t ${REGISTRY}/${1}:latest ${2}
    docker push ${REGISTRY}/${1}
}

bp "spa" "spa"
bp "api" "api"
bp "inv" "inventory"
bp "recs" "recommendations"
