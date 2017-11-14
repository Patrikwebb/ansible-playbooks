#!/bin/sh

COLOR=$(curl http://127.0.0.1:8500/v1/kv/webapp/color?raw)

if [ "$COLOR" = "blue" ]; then
    echo "green"
else
    echo "blue"
fi
