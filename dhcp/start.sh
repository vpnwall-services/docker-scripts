#!/bin/bash
docker run -it --rm --net=host -v "$(pwd)/resources:/data" localhost:5000/networkboot/dhcpd enp2s0
