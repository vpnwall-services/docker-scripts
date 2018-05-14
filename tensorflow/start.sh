#!/bin/bash
docker run -it -p 8888:8888 -v /opt/dockerdrive/tensorflow:/opt/tensorflow localhost:5000/tensorflow/tensorflow
