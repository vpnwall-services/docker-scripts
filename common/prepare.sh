#!/bin/bash

# to iterate through array
#imagelist=(value1,value2)
#for i in "${imagelist[@]}"
#do
#done

imagename=$1
clear
if [ -z $imagename ]
then
	echo "Please input image name"
	exit
else
	echo "Prepare $imagename image ..."
	docker pull $imagename
	docker tag $imagename localhost:5000/$imagename
	docker push localhost:5000/$imagename
	docker image remove $imagename
	docker image remove localhost:5000/$imagename
fi
