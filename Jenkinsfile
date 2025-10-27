pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/hansikagollen/ci-cd-with-docker-with-kubernetes.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'python -m unittest discover -s tests'
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: '**/*.py', fingerprint: true
            }
        }
    }
}
