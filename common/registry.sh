#!/bin/bash

#docker kill registry
#docker rm -v registry
#docker run -d -p 5000:5000 --name registry registry:2

#To push
#docker pull remnux/metasploit
#docker tag remnux/metasploit 192.168.1.25:5000/dockersploit
#docker push 192.168.1.25:5000/dockersploit

#To Pull
#docker pull 192.168.1.25:5000/dockersploit
#docker stop registry && docker rm -v registry
#!/bin/bash
# Docker registry

clear
echo -e "Starting Docker Registry ..."
#docker kill registry
docker run -d -p 5000:5000 --restart=always --name registry -v /opt/dockerdrive/registry:/var/lib/registry registry:2
