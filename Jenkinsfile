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

    }
}