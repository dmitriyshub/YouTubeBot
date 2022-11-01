pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'echo building...'
            }
        }
        stage('Stage II') {
            steps {
                sh 'echo "stage II!!..."'
            }
        }
        stage('Stage III ...') {
            steps {
                sh 'echo "stage III!!!..."'
                sh 'echo $BOT_IMAGE_NAME'
            }
        }

    }
}