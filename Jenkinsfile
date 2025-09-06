pipeline {
  agent any

  environment {
    APP_NAME = 'web-demo'
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/<YourUser>/<YourRepo>.git'
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
          docker compose down || true
          docker compose up -d --force-recreate
        '''
      }
    }
  }

  post {
    success {
      echo "✅ Deployment successful! Website updated"
    }
    failure {
      echo "❌ Deployment failed. Check logs."
    }
  }
}
