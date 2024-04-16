pipeline {
    agent any
    tools {
	    maven "MAVEN3"
	    jdk "openJDK11"
	}

    environment {
        registryCredential = 'ecr:eu-west-3:aws_creds'
        appRegistry = "851725214577.dkr.ecr.eu-west-3.amazonaws.com/cloudhightimg"
        vprofileRegistry = "https://851725214577.dkr.ecr.eu-west-3.amazonaws.com"
         AWS_DEFAULT_REGION = 'eu-west-3'
        ECR_REGISTRY = '851725214577.dkr.ecr.eu-west-3.amazonaws.com'
        ECR_REPO_NAME = 'cloudhightimg'
        ASG_NAME = 'cloudhight-asg'
        DOCKER_IMAGE_TAG = sh(script: 'echo ${BUILD_NUMBER}', returnStdout: true).trim()
        // This assumes you have a BUILD_NUMBER or another variable containing the image version
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
       steps {
       
         script {
                dockerImage = docker.build( appRegistry + ":$BUILD_NUMBER", ".")
             }

     }
    
    }

    stage('Upload App Image') {
          steps{
            script {
              docker.withRegistry( vprofileRegistry, registryCredential ) {
                dockerImage.push("$BUILD_NUMBER")
                dockerImage.push('latest')
              }
            }
          }
     }
	  stage('Deploy to Auto Scaling Group') {
            steps {
                script {
                    // Log in to ECR
                    sh "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${ECR_REGISTRY}"

                    // Pull Docker image from ECR
                    sh "docker pull ${ECR_REGISTRY}/${ECR_REPO_NAME}:${DOCKER_IMAGE_TAG}"

                    // Trigger rolling deployment in Auto Scaling Group
                    sh "aws autoscaling update-auto-scaling-group --auto-scaling-group-name ${ASG_NAME} --launch-template LaunchTemplateId=lt-0931367f499ea9f6b,Version=5"
                }
            }
        }

  }
}
