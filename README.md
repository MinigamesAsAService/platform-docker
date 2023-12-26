# platform-docker
Docker image for configuring and running a Minecraft Server

The docker image is based off of [itzg/minecraft-server](https://github.com/itzg/docker-minecraft-server) which is licensed under `Apache License 2.0`

# Building
Build the docker image using:
```
docker build -t platform-image-dev .
```

# Run the container
First grab a presigned URL for the config zip file from S3, or host the zip file somewhere.

Add the following line to `.env.docker-compose`
```
CONFIG_PATH='https://insert-url-here'
```

Run the container using docker-compose
```
docker-compose up -d
```

# Configuration
The configurations can be set in docker-compose (or when creating the container via k8s), or inside the Dockerfile. 
The base image has lots of configurations, such as TYPE, that'll be useful for us. 

Find the base image documentation [here](https://docker-minecraft-server.readthedocs.io/en/latest/configuration/server-properties)
