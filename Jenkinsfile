pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the GitHub repository
                git 'https://github.com/gokul4510/devops-build.git'
            }
        }
        stage('Build') {
            steps {
                // Build the application (can be customized based on your project)
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                // Run tests (if applicable)
                sh 'npm test'
            }
        }
        stage('Deploy') {
            steps {
                // Deploy the application (can be customized based on your project)
                sh 'docker build -t react-app:dev .'
                sh 'docker run -d -p 80:80 react-app:dev'
            }
        }
    }
}

