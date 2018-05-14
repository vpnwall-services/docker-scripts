#!/bin/bash
docker run -d -p 9000:9000 --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer:/data localhost:5000/portainer/portainer
echo "Go to http://DOCKER_HOST:9000"
