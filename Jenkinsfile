pipeline {
    agent {
        docker {
            image 'node:22'
        }
    }
    
    environment {
        APP_NAME = "mi-app"
        IMAGE = "mi-app:latest"
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sadh19/landing_page.git' 
            }
        }
        stage('Install') {
            steps {
                sh 'npm ci'
            }
        }
        stage('Build App') {
            steps {
                sh 'npm run build'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE .'
            }
        }
        stage('Local deploy') {
            steps {
                sh '''
                    docker stop $APP_NAME || true
                    docker rm $APP_NAME || true
                    docker run -d \
                    --name $APP_NAME \
                    -p 3000:80 \
                    $IMAGE
                '''
            }
        }
    }
    
    post {
        success {
            echo 'Deploy exitoso 🚀'
        }
        failure {
            echo 'El deploy ha fallado ❌'
        }
    }
}