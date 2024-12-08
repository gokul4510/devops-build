pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh './build.sh'
            }
        }
        stage('Push') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh 'docker push gokul4510/react-app-dev:latest'
                    } else if (env.BRANCH_NAME == 'master') {
                        sh 'docker push gokul4510/react-app-prod:latest'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}



