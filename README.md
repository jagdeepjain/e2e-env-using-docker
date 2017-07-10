# End to End developement Environment on Docker
This project shows how to use docker for devlopement and testing requirements

<figure>
<img src="https://github.com/jagdeepjain/e2e-env-using-docker/blob/master/images/dev-env-using-docker.png" alt="" />
</figure>

Run below command:

```
$ ./script.sh
```

It will do the following:
1. pull the latest code from git repository
2. mvn verify
3. mvn package
4. build docker image
5. docker run -d -p 8080:8080 jagdeepjain/jetty-container:1
6. mvn test
7. push jetty-container image to docker hub

Docker image will only be pushed to docker hub if the tests execution is successful. If the test fail then the user will be having prior docker image for usage.
