#!/bash/sh

# curl --request PUT blue
curl --request PUT http://127.0.0.1:8500/v1/kv/webapp/blue

# curl --request PUT green
curl --request PUT http://127.0.0.1:8500/v1/kv/webapp/green

# curl GET
curl http://127.0.0.1:8500/v1/kv/webapp/color?raw
