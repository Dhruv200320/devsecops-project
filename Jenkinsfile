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
                sh '''
                docker run --rm -v $PWD:/workspace -w /workspace/terraform hashicorp/terraform:latest init
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                docker run --rm -v $PWD:/workspace -w /workspace/terraform hashicorp/terraform:latest validate
                '''
            }
        }

    }
}