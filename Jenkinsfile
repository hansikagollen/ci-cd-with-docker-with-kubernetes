pipeline {
    agent any

    environment {
        // Optional: specify Python path if not in system PATH
        PYTHON = 'python'
    }

    stages {
        stage('Checkout') {
            steps {
                echo '📦 Checking out code from GitHub...'
                git branch: 'main', url: 'https://github.com/hansikagollen/ci-cd-with-docker-with-kubernetes.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo '📥 Installing Python dependencies...'
                bat '''
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
            }
        }

        stage('Build & Test') {
            steps {
                echo '🧪 Running Unit Tests...'
                bat 'python -m unittest discover .'

            }
        }

        stage('Archive Artifact') {
            steps {
                echo '📂 Archiving Python files...'
                archiveArtifacts artifacts: '**/*.py', fingerprint: true
            }
        }
    }

    post {
        success {
            echo '✅ Build and test stages completed successfully!'
        }
        failure {
            echo '❌ Build failed. Please check logs for details.'
        }
    }
}
