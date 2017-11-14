#!/bin/bash

set -e

MANAGER="10.0.7.10"

SWARM_ACTIVE='(sudo docker info | grep "Swarm: active" > /dev/null)'
MANAGER_CMD="$SWARM_ACTIVE || sudo docker swarm init --advertise-addr $MANAGER"
vagrant ssh swarm_manager -c "$MANAGER_CMD"
WORKER_TOKEN=$(vagrant ssh swarm_manager -c 'sudo docker swarm join-token -q worker' | sed 's/\r//g')

echo "Got worker token: $WORKER_TOKEN"

vagrant ssh swarm_worker_2 -c "$SWARM_ACTIVE || sudo docker swarm join --token $WORKER_TOKEN $MANAGER"
vagrant ssh swarm_worker_1 -c "$SWARM_ACTIVE || sudo docker swarm join --token $WORKER_TOKEN $MANAGER"

echo "Swarm is up"
vagrant ssh swarm_manager -c 'sudo docker node ls'
