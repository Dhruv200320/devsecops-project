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
                curl -L https://github.com/aquasecurity/trivy/releases/latest/download/trivy_0.50.0_Linux-64bit.tar.gz -o trivy.tar.gz
                tar zxvf trivy.tar.gz
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