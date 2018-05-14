#!/bin/bash
docker run -d -p 4444:4444 -v /dev/shm:/dev/shm localhost:5000/selenium/standalone-firefox
