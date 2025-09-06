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

    stage('Check Files') {
      steps {
        echo "Checking pulled files..."
        sh 'ls -l web/'
        sh 'head -n 5 web/index.html'
      }
    }

    stage('Build Docker Image') {
      steps {
        echo "Building Docker image..."
        sh 'docker compose build --no-cache'
      }
    }

    stage('Deploy Container') {
      steps {
        echo "Deploying new container..."
        sh '''
          docker compose down || true
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
      echo "❌ Deployment failed."
    }
  }
}
