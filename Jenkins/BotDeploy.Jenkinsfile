pipeline {
    agent any

    stages {
        stage('Install Ansible') {
            steps {
                sh 'python3 -m pip install ansible'
                sh '/var/lib/jenkins/.local/bin/ansible-galaxy collection install community.general'
            }
        }
        stage("Generate Ansible Inventory") {
    environment {
        BOT_EC2_APP_TAG = "<your-bot-machine-app-tag-value>"
        BOT_EC2_REGION = "<your-bot-machine-region>"
    }
        steps {
            sh 'aws ec2 describe-instances --region $BOT_EC2_REGION --filters "Name=tag:App,Values=$BOT_EC2_APP_TAG" --query "Reservations[].Instances[]" > hosts.json'
            sh 'python3 prepare_ansible_inv.py'
            sh '''
            echo "Inventory generated"
            cat hosts
            '''
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