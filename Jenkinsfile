pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/KmWahba2000/web-demo.git'
            }
        }

        stage('Deploy Container') {
            steps {
                echo "Deploying new container..."
                sh '''
                    docker compose down --remove-orphans
                    docker compose up -d --build
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
