pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh './update.sh'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing'
            }
        }

        stage('Deploy - Staging') {
            steps {
                sh './deploy'
            }
        }

        stage('Sanity check') {
            steps {
                input "Does the staging environment look ok?"
            }
        }

        stage('Deploy - Production') {
            steps {
                sh './finish'
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
