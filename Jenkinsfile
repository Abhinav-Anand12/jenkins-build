def ci_branches =  ['S','P']
pipeline {
	agent none
  options {
      buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    GOOGLE_BUCKET = "mylyapp.com"0`
-  }
  stages {
    stage('Checkout') {
    agent {
            label 'master'
	    }
      steps {
        script {
          // Pull the code from bitbucket repository
          checkout scm
        }
      }
    }
    stage('Build') {
        agent {
             label 'master'
	    }
            steps {
                script {
                  if (env.BRANCH_NAME.equals('S')) {
                    sh "hugo -b 'https://mylyapp.tech'"
                  }
                }
              }
    }
     stage('Build') {
        agent {
             label 'myagent'
	    }
      steps {
        script {
          if (env.BRANCH_NAME.equals('P')) {
                    sh "hugo -b 'https://mylyapp.com'"
          }
        }
      }
    }

    stage('Deploy') {
        agent {
            label 'master'
	    }
        steps {
            script {
              if (env.BRANCH_NAME.equals('S')) {
                docker.script.sh(script:"docker cp public ui-integration:/tmp/") //copy public folder from workspace to ui-integration container
                docker.script.sh(script:"docker exec -i ui-integration bash -c 'rm -rf /usr/share/nginx/html/*'")
                docker.script.sh(script:"docker exec -i ui-integration bash -c 'mv /tmp/public/* /usr/share/nginx/html'")
                docker.script.sh(script:"docker exec -i ui-integration bash -c 'chown root:root -R /usr/share/nginx/html/*'")
              }
            }
      }
    }
    stage ('Deploy') {
        agent {
            label 'myagent'
	    }
	    steps {
            script {
              if (env.BRANCH_NAME.equals('P')) {
                docker.script.sh(script:"docker cp public ui-production:/tmp/") //copy public folder from workspace to ui-production container
                docker.script.sh(script:"docker exec -i ui-production bash -c 'rm -rf /usr/share/nginx/html/*'")
                docker.script.sh(script:"docker exec -i ui-production bash -c 'mv /tmp/public/* /usr/share/nginx/html'")
                docker.script.sh(script:"docker exec -i ui-production bash -c 'chown root:root -R /usr/share/nginx/html/*'")
              }
            }
        }
    }
  }
//   post {
//     // Send the build status to slack channel
//     success {
//       slackSend (color:'good', message: "Successfully deployed  ${env.JOB_NAME} ")
//     }
//     failure {
//         slackSend (color:'danger', message: "Error in build+deploy ${env.JOB_NAME} ")
//     }
//   }
}
