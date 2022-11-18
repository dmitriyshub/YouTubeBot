pipeline {
    agent {
        docker {
            image '352708296901.dkr.ecr.us-west-2.amazonaws.com/jenkins-agent-dmitriyshub:latest'
            args  '--user root -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        REGISTRY_URL = "352708296901.dkr.ecr.us-west-2.amazonaws.com"
        IMAGE_TAG = "0.0.$BUILD_NUMBER"
        IMAGE_NAME = "youtube-bot-dmitriyshub"
        REGION_NAME = "us-west-2"
    }

    options {
        buildDiscarder(logRotator(daysToKeepStr: '30'))
        disableConcurrentBuilds()
        timestamps()
    }

    stages {

        stage('Build Bot app') {
        environment{
        SNYK_TOKEN = credentials('SNYK_TOKEN')
        }

            steps {
                   sh '''
                   aws ecr get-login-password --region $REGION_NAME | docker login --username AWS --password-stdin $REGISTRY_URL
                   docker build -t $IMAGE_NAME:$IMAGE_TAG .
                   docker tag $IMAGE_NAME:$IMAGE_TAG $REGISTRY_URL/$IMAGE_NAME:$IMAGE_TAG
                   snyk container test $REGISTRY_URL/$IMAGE_NAME:$IMAGE_TAG --severity-threshold=high
                   docker push $REGISTRY_URL/$IMAGE_NAME:$IMAGE_TAG
                   '''
                }
            }
        }
            post {
                always {
                    sh '''
                    docker rmi $REGISTRY_URL/$IMAGE_NAME:$IMAGE_TAG
                    docker rmi $IMAGE_NAME:$IMAGE_TAG
                    '''
                }
            }
            options {
                timeout(time: 10, unit: 'MINUTES')
            }
        }

        stage('Trigger Deploy') {
            steps {
                build job: 'BotDeploy', wait: false, parameters: [
                    string(name: 'BOT_IMAGE_NAME', value: "${REGISTRY_URL}/${IMAGE_NAME}:${IMAGE_TAG}")
        ]
    }
}
    }
}