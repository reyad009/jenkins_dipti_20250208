pipeline {
    agent any

    parameters {
        string(name: 'BUILD_VERSION', defaultValue: 'latest', description: 'Docker image tag')
    }

    stages {
        stage('Print Parameters') {
            steps {
                echo "BUILD_VERSION: ${params.BUILD_VERSION}"
            }
        }
        
        stage('Checkout Code') {
            steps {
                git 'https://github.com/reyad009/jenkins_dipti_20250208.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("https://hub.docker.com/repository/docker/reyad009/docker/general:${params.BUILD_VERSION}")
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials-id') {
                        docker.image("https://hub.docker.com/repository/docker/reyad009/docker/general:${params.BUILD_VERSION}").push()
                    }
                }
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
    }
}
