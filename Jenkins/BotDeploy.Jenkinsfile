pipeline {
    agent any

    stages {
        stage('Install Ansible') {
            steps {
                sh 'python3 -m pip install ansible'
                sh '/var/lib/jenkins/.local/bin/ansible-galaxy collection install community.general'
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