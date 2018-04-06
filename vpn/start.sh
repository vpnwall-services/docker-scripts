#!/bin/bash

docker run -d --cap-add NET_ADMIN \
	-p 500:500/udp \
	-p 4500:4500/udp \
	-p 1701:1701/tcp \
	-p 1194:1194/udp \
	-p 5555:5555/tcp localhost:5000/siomiz/softethervpn
