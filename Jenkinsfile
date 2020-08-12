#!groovy

pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'checking for latest jenkins/jenkins:lts and building if one exits'
                script { 
 		 try {
		   def ret = sh(script:'./update.sh', returnStdout:true).trim()
	           println ("ret is",ret)
	         } catch (Exception ex) {
  		   println("Error in build: ${ex}")
		 }
	       }
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
                echo 'This is the current docker image'
		sh './current.sh'
            }
        }

        /*stage('Sanity check') {
            steps {
               input "Does the staging environment look ok?"
            }
        }*/

        stage('Deploy - Production') {
            steps {
                echo 'This is the created date form latest jenkins/jenkins:lts'
                sh """docker inspect jenkins/jenkins:lts --format \"{{.Created}}\""""
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
