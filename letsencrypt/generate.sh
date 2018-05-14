#!/bin/bash
echo -e "\nEmail ? :"
read MAIL
echo -e "URL ? :"
read URL
docker create \
	--cap-add=NET_ADMIN \
	--name=letsencrypt \
	-v $(pwd)/data:/config \
	-e PGID=1001 -e PUID=1001  \
	-e EMAIL=$MAIL \
	-e URL=$URL \
	-e SUBDOMAINS=www,ftp,cloud \
	-e VALIDATION=tls-sni \
	-p 80:80 -p 443:443 \
	-e TZ=Europe/Paris \
	localhost:5000/linuxserver/letsencrypt
