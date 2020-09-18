# docker-otel-colletor

This docker container tests the otel colletor config. 

## Installation


IMPORTANT: make sure docker.env is in .gitignore. We don't want credentials in the repo

1) copy docker.env.example to docker.env. Edit docker.env to set the correct credentials

2) Run this to build the image locally.

```shell script
make docker-build-clean && make docker-start
# test the healthcheck with curl
curl http://localhost:13133
{"status":"Server available","upSince":"2020-09-18T08:31:16.4199417Z","uptime":"12.318960941s"}
```