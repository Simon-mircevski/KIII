pipeline {
    agent any

    environment {
        // Define your Docker Hub credentials
        DOCKER_HUB_CREDENTIALS = credentials('docker')
    }

    stages {
        stage('Build') {
            steps {
                // Checkout the source code from GitHub
                git 'https://github.com/Simon-mircevski/KIII'
                
                // Build Docker image
                script {
                    dockerImage = docker.build('KIII')
                }
            }
        }

        stage('Test') {
            steps {
                // You can add test steps here if needed
                echo 'Running tests...'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                // Push Docker image to Docker Hub
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed :('
        }
    }
}
