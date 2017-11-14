#!/bin/bash

set -e

fail () {
    error="$1"
    [[ -n $error ]] || error="Deployment failed"
    echo "Error: $error"
    exit 1
}

read TAG

[[ -n $TAG ]] || fail "No tag specified"

export TAG

echo "Using tag: $TAG"

docker-compose pull
