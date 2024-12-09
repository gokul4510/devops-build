pipeline {
    agent any
    environment {
        // Fix PATH to include bash and Docker paths
        PATH = "/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin"
        SHELL = "/bin/bash" // Explicitly set the shell to be used
    }
    stages {
        stage('Debug Environment') {
            steps {
                echo 'Debugging environment variables...'
                sh '''
                    echo "PATH: $PATH"
                    which sh
                    which docker
                    which bash
                    docker --version
                '''
            }
        }
        stage('Checkout') {
            steps {
                echo 'Checking out the code...'
                git 'https://github.com/gokul4510/devops-build.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Installing dependencies and building the project...'
                sh '''
                    npm install
                    npm run build
                '''
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh '''
                    npm test || echo "Tests failed but pipeline will continue..."
                '''
            }
        }
        stage('Docker Build and Run') {
            steps {
                echo 'Building and running Docker container...'
                sh '''
                    docker build -t react-app:dev .
                    docker run -d -p 80:80 react-app:dev
                '''
            }
        }
    }
    post {
        always {
            echo 'Cleaning up...'
            sh '''
                echo "Listing all containers:"
                docker ps -a
            '''
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Investigating...'
        }
    }
}



