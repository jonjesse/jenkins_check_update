#!groovy

pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'checking for latest jenkins/jenkins:lts and building if one exits'
                sh './update.sh'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing for latest jenkins/jenkins:lts docker image installed'
                sh './test.sh'
            }
        }

        stage('Deploy - Staging') {
            steps {
                echo 'nothing to do here'
            }
        }

        /*stage('Sanity check') {
            steps {
               input "Does the staging environment look ok?"
            }
        }*/

        stage('Deploy - Production') {
            steps {
                echo 'nothing to do here'
            }
        }
    }
    post {
        always {
            echo "This always posts, reached the end"
        }
        success {
            echo "Finished successfully"
        }
        failure {
            echo "I failed, check logs"
        }
        unstable {
            echo 'Unknown state, check logs'
        }
        changed {
            echo 'You may see this message, safe to ignore'
        }
    }
}
