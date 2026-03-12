pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Dhruv200320/devsecops-project.git'
            }
        }

        stage('Terraform Security Scan') {
            steps {
                sh '''
                docker run --rm -v $PWD:/project aquasec/trivy config /project/terraform
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