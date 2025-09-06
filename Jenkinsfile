pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/KmWahba2000/web-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker compose build --no-cache'
                reuseNode true
            }
        }

        stage('Deploy Container') {
            steps {
                echo "Deploying new container..."
                sh '''
                    docker compose down -v
                    docker compose up -d --force-recreate --build
                '''
            }
        }

    }

    post {
        success {
            echo "✅ Deployment successful! Website updated."
        }
        failure {
            echo "❌ Deployment failed!"
        }
    }
}
