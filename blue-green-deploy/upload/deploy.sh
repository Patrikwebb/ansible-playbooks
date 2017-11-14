#!/bin/sh
COLOR=$(sh get_next_color.sh)
docker build --tag=webapp webapp
docker tag webapp webapp-$COLOR
docker-compose --project=webapp stop webapp-$COLOR
docker-compose --project=webapp rm --force webapp-$COLOR
docker-compose --project=webapp up -d webapp-$COLOR && \
    consul-template -consul 127.0.0.1:8500 -once -template "webapp-$COLOR.ctmpl:webapp.conf.tmp" && \
    cat webapp.conf.tmp > webapp.conf && \
    rm webapp.conf.tmp && \
    docker-compose --project=webapp kill -s HUP proxy && \
    curl --data $COLOR --request PUT http://127.0.0.1:8500/v1/kv/webapp/color
