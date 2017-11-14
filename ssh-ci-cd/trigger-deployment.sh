#!/bin/bash

set -e

fail () {
    echo "Failed to deploy: $1"
    exit 1
}

# The following variables should be set as project variables in
# GitLab
[[ -n $STAGING_SERVER ]] || fail "No staging server specified"

[[ -n $SSH_PRIVATE_KEY ]] || fail "No ssh key specified"
echo "$SSH_PRIVATE_KEY" > ssh_key
chmod u=r,go= ssh_key

# GitLab variables are set with Windows line breaks (Why the
# face?)
sed -i 's/\r//g' ssh_key

[[ -n $STAGING_SSH_REMOTE_KEY ]] || fail "No remote public key given"
mkdir -p $HOME/.ssh
echo "$STAGING_SSH_REMOTE_KEY" >> $HOME/.ssh/known_hosts

# Set default tag to latest
TAG=${1:-latest}

echo "Deploying tag $TAG"

echo "$TAG" \
  | ssh -i ssh_key \
        -p ${STAGING_SERVER_SSH_PORT:-22} \
        deploy@$STAGING_SERVER
