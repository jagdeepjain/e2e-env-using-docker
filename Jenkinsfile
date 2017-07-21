node 
{
  	checkout scm
  	stage('Package') 
  	{
     	sh 'mvn clean package'
  	}
  	
  	stage('Create Docker Image') 
	{
		docker.build("belalansari/restful-service:0.1")
  	}
  	stage(Push to docker hub)
  	{
  		//sh "docker login -u <username> -p <password> -e <youremailid>"
		//docker.build("belalansari/restful-service:0.2").push
  	}
}  	