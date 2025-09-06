pipeline {
  agent any

  environment {
    APP_NAME = "web-demo"
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/KmWahba2000/web-demo.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker compose build'
      }
    }

    stage('Deploy') {
      steps {
        sh '''
          docker compose down || true
          docker compose up -d
        '''
      }
    }
  }

  post {
    success {
      echo "✅ Deployment successful! Visit http://localhost:9090"
    }
    failure {
      echo "❌ Build or Deploy failed!"
    }
  }
}
