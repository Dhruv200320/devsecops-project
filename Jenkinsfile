pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Dhruv200320/devsecops-project.git'
            }
        }

        stage('Install Trivy') {
            steps {
                sh '''
                curl -L -o trivy https://github.com/aquasecurity/trivy/releases/latest/download/trivy_Linux-64bit
                chmod +x trivy
                '''
            }
        }

        stage('Terraform Security Scan') {
            steps {
                sh '''
                ./trivy config terraform/
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                cd terraform
                terraform init
                terraform validate
                '''
            }
        }

    }
}