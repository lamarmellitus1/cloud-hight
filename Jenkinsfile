pipeline {
    agent any
    tools {
	    maven "MAVEN3"
	    jdk "openJDK11"
	}

    environment {
        registryCredential = 'ecr:eu-west-3:awscreds'
        appRegistry = "002981613347.dkr.ecr.eu-west-3.amazonaws.com/vprofile-repo"
        vprofileRegistry = "https://002981613347.dkr.ecr.eu-west-3.amazonaws.com"
    }
  stages {
    stage('Fetch code'){
      steps {
        git branch: 'docker', url: 'https://github.com/devopshydclub/vprofile-project.git'
      }
    }


    stage('Test'){
      steps {
        sh 'mvn test'
      }
    }

    stage ('CODE ANALYSIS WITH CHECKSTYLE'){
            steps {
                sh 'mvn checkstyle:checkstyle'
            }
            post {
                success {
                    echo 'Generated Analysis Result'
                }
            }
        }
    stage('Build App Image') {

environment {
             ecrRepository = "851725214577.dkr.ecr.eu-west-3.amazonaws.com"
            NAME = "cloudhight"
                 }
       steps {
                withAWS(region: 'eu-west-1', role: 'arn:aws:iam::851725214577:role/cloudhightECR') {
                                sh "aws ecr describe-repositories --repository-names ${NAME} || aws ecr create-repository --repository-name ${NAME} --image-scanning-configuration scanOnPush=true"
                                sh "aws ecr get-login-password \
                                | docker login \
                                    --password-stdin \
                                    --username AWS \
                                    '${ecrRepository}/${NAME}'"
                                sh "docker build -t ${NAME} -f Dockerfile ."
                                sh "docker tag ${NAME} ${ecrRepository}/${NAME}:${BUILD_NUMBER}"
                            sh "docker push ${ecrRepository}/${NAME}:${BUILD_NUMBER}"                        
                  }

    }
    }
  

  }
}