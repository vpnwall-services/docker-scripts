#!/bin/bash
echo "create data/dhcpd.conf with a subnet clause"
echo "for the specified network interface of the machine"
echo "running docker, start the container with the"
echo "--net=host option and specify interface to run the dhcp on"
echo "run docker run -it --rm --net=host -v '$(pwd)/data':/data networkboot/dhcpd eth0'"
echo "use ctrl+c to stop it"
echo "start with simply run option to iterate though options"
mkdir $(pwd)/data
cat << EOF > $(pwd)/data/dhcpd.conf
subnet 192.168.137.0 netmask 255.255.255.0 {
	range 192.168.137.20	192.168.137.30;
	option domain-name-servers 8.8.8.8;
	option routers	192.168.137.1;
}
EOF
docker run -it --rm --net=host -v "$(pwd)/data:/data" networkboot/dhcpd enp0s3
