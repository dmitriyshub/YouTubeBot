pipeline {
    agent any

    stages {
        stage('Install Ansible') {
            steps {
                sh 'python3 -m pip install ansible'
                sh '/usr/bin/ansible-galaxy collection install community.general'
            }
        }
        stage('Stage II') {
            steps {
                sh 'hostname -I | awk '{print $1}' > hosts.json'
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