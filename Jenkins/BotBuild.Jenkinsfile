pipeline {
    agent any

    environment {
        REGISTRY_URL = "352708296901.dkr.ecr.us-west-2.amazonaws.com"
        IMAGE_TAG = "0.0.$BUILD_NUMBER"
        IMAGE_NAME = "youtube-bot-dmitriyshub"
        REGION_NAME = "us-west-2"
    }

    stages {

        stage('Build Bot app') {
            steps {
                sh '''
                   aws ecr get-login-password --region $REGION_NAME | docker login --username AWS --password-stdin $REGISTRY_URL
                   docker build -t $IMAGE_NAME:$IMAGE_TAG .
                   docker tag $IMAGE_NAME:$IMAGE_TAG $REGISTRY_URL/$IMAGE_NAME:$IMAGE_TAG
                   docker push $REGISTRY_URL/$IMAGE_NAME:$IMAGE_TAG
                   '''
            }
            post {
                always {
                    sh '''
                    docker rmi $REGISTRY_URL/$IMAGE_NAME:$IMAGE_TAG
                    '''
                }
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