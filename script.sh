#!/bin/bash
_success=0
#pull latest code
#git pull origin master

#build the project
 mvn verify -Dmaven.test.skip=true
 mvn package -Dmaven.test.skip=true
#build the docker image
if [ "$?" -eq  $_success ]; then
    echo "Maven build successful!.. start build docker Image...";
    docker build -t jetty:1 . ;
else
   echo "Maven build fail..";
   exit 1
fi

if [ $? ==  $_success ]; then
    echo "Start running docker container..."
    docker run -d -p 8080:8080 jetty:3
else
   echo "Building docker container fail.."W
   exit 1
fi

if [ $? == $_success ]; then
    echo "Start executing test cases"
    mvn test
else
  echo "Docker container running failing"
  exit 1
fi 
echo "$?"

if [ $? == $_success ]; then
    echo "pushing into docker hub"

else
   echo "Test execution fail"
   exit 1
fi
