#!/bin/bash
#docker build /home/task3/client/ -t mhodali/client
if [ "$(docker ps -a | grep mhodali/client)" ]; then
  docker stop $(docker ps -a | grep mhodali/client |awk '{print  $1}')
  docker rm $(docker ps -a | grep mhodali/client |awk '{print  $1}')
fi
docker run -dit --name client -p 80:80  -t mhodali/client

