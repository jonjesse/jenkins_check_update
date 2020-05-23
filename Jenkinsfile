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
            echo "One way or another, I'm done"
        }
        success {
            echo "This is success"
        }
        failure {
            echo "I failed"
        }
        unstable {
            echo 'I am unstable :/'
        }
        changed {
            echo 'Things were different before...'
        }
    }
}
