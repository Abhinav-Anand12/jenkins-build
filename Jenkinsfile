// A single branch to be build
def my_branch = 'master'

// The default ipAddress where source code build happens
def build_host_address = 'tcp://172.17.0.1:12375'



pipeline {
    agent any
    // Set log rotation, timeout in the options section
    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    if (env.BRANCH_NAME.equals(my_branch)) {
                        // Pull the code from bitbucket repository
                        checkout scm
                    }
                }
            }
        }
        stage('SET ENV') {
            steps {
                script {
                    if (env.BRANCH_NAME.equals(my_branch)) {
                        // List all the environment variable in the SET ENV stage
                        def node = tool 'node12'
                        env.PATH = "${node}/bin:${env.PATH}"
                        env.NODE_PATH="${node}/lib/node_modules:."
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Build the docker image if and only if the branch name is same as my_branch
                    // and the branch host ip address is present in build_docker_hosts.
                    if (env.BRANCH_NAME.equals(my_branch)) {
                        withDockerServer([uri:build_host_address]) {
                            withDockerRegistry([credentialsId: 'registryUser', url: "https://registry.hotelsoft.tech/"]) {
                                def image = docker.build("new:${env.BRANCH_NAME}")
//                                 image.push()
                            }
                        }
                    }
                }
            }
        }

    }
//     post {
//         // Send the build result to slack channel
//         success {
//           slackSend (color:'good', message: "Successfully deployed  ${env.JOB_NAME} ")
//         }
//         failure {
//             slackSend (color:'danger', message: "Error in build+deploy ${env.JOB_NAME} ")
//         }
//     }
}
