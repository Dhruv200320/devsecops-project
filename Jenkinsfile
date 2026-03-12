pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Dhruv200320/devsecops-project.git'
            }
        }

        stage('Terraform Init') {
            steps {
                bat '''
                cd terraform
                terraform init
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                bat '''
                cd terraform
                terraform validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    bat '''
                    set AWS_ACCESS_KEY_ID=%AWS_ACCESS_KEY_ID%
                    set AWS_SECRET_ACCESS_KEY=%AWS_SECRET_ACCESS_KEY%
                    set AWS_DEFAULT_REGION=us-east-1

                    cd terraform
                    terraform plan
                    '''
                }
            }
        }

    }
}