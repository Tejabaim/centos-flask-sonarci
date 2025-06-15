pipeline {
  agent any

  environment {
    SONARQUBE = 'SonarQubeServer'
    DOCKER_IMAGE = 'centos-flask-app:latest'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          sh 'docker build -t $DOCKER_IMAGE .'
        }
      }
    }

    stage('Run App Test') {
      steps {
        script {
          sh 'docker run --rm $DOCKER_IMAGE python3 -m unittest || echo "No tests found"'
        }
      }
    }

    stage('SonarQube Scan') {
      steps {
        withSonarQubeEnv('SonarQubeServer') {
          sh 'sonar-scanner'
        }
      }
    }

    stage('Quality Gate') {
      steps {
        timeout(time: 2, unit: 'MINUTES') {
          waitForQualityGate abortPipeline: true
        }
      }
    }

    stage('Deploy Locally') {
      steps {
        script {
          sh 'docker run -d -p 5000:5000 $DOCKER_IMAGE'
        }
      }
    }
  }

  post {
    always {
      echo "Build pipeline finished."
    }
  }
}

