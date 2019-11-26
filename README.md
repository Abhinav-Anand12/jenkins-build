# jenkins-build
# API server based on FastAPI

This repo contains all the code for writing APIs based on FastAPI/Starlette.

## Building image
```shell script
docker build -t abhinav12/myrep:latest .
```

## Run in container
```shell script
docker run -itd --name fastapp --restart unless-stopped abhinav12/myrep:latest
```
