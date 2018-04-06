#!/bin/bash

mkdir -p /opt/dockerdrive/squidcache
#selinux rule
#chcon -Rt svirt_sandbox_file_t /opt/dockerdrive/squidcache
echo -e "Starting Squid Image ..."
docker run --name squid -d --restart=always \
	--publish 3128:3128 \
	--volume /opt/dockerdrive/squidcache:/var/spool/squid3 \
	localhost:5000/sameersbn/squid
docker start squid
