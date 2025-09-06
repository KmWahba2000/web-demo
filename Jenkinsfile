pipeline {
  agent any

  environment {
    APP_NAME = 'web-demo'
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/KmWahba2000/web-demo.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker compose build --no-cache'
      }
    }

    stage('Deploy Container') {
      steps {
        sh '''
          docker compose down
          docker compose up -d --build
        '''
      }
    }
  }

  post {
    success {
      echo "✅ Deployment successful!"
    }
    failure {
      echo "❌ Deployment failed. Check logs."
    }
  }
}
