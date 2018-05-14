#!/bin/bash
#docker run -it -v /dev/shm:/dev/shm -p 4444:4444 localhost:5000/seleniumbot
#docker run -it -v /dev/shm:/dev/shm -p 4444:4444 localhost:5000/danielfrg/selenium
docker run -d --name=grid -p 4444:24444 -p 5900:25900 \
      -e TZ="EU/Paris" -v /dev/shm:/dev/shm --privileged localhost:5000/elgalu/selenium

docker exec grid wait_all_done 30s
