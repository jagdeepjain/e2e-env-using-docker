#!/bin/bash
_success=0
#pull latest code
git pull origin master
#build the project
mvn verify -Dmaven.test.skip=true
mvn package -Dmaven.test.skip=true

#build the docker image
if [ "$?" -eq  $_success ]; then
    echo "start build docker image...";
    docker build -t jagdeepjain/jetty-container:1 . ;
else
   echo "maven build failed...";
   exit 1
fi

if [ $? ==  $_success ]; then
    echo "Start running docker container..."
    docker run -d -p 7000:7000 jagdeepjain/jetty-container:1
else
   echo "building docker container failed..."
   exit 1
fi

if [ $? == $_success ]; then
    echo "start executing test cases..."
    mvn test
else
  echo "something went wrong..."
  exit 1
fi 
echo "$?"

if [ $? == $_success ]; then
    echo "pushing image to docker hub..."

else
   echo "test execution failed..."
   exit 1
fi
