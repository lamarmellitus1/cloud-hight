pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
        disableConcurrentBuilds()
        parallelsAlwaysFailFast()
    }

    stages {
        stage('Fetch code'){
            steps {
                git branch: 'main', url: 'https://github.com/lamarmellitus1/cloud-hight.git'
            }
        }
        stage('Cloudheight Production') {
            environment {
                NAME = "cloudhightimg"
                AWS_DEFAULT_REGION = "eu-west-3"
                ecrRepository = "851725214577.dkr.ecr.eu-west-3.amazonaws.com"
            }
            steps {
                sh "aws ecr get-login-password --region $AWS_DEFAULT_REGION \
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
