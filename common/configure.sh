#!/bin/bash

clear
echo -e "Configuration of docker service ..."
mkdir /opt/dockerdrive/{docker,registry}
cat << EOF > /etc/docker/daemon.json
{ "graph": "/opt/dockerdrive/docker", "storage-driver": "overlay" }
EOF
service docker restart
