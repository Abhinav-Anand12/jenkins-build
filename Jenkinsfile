// A single master branch to be build
def my_branch = 'master'

// The default ipAddress where source code build happens
def build_host_address = 'tcp://192.168.99.102:2376'



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
                        // Pull the code from github repository
                        checkout scm
                }
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    // Build the docker image if and only if the branch name is same as my_branch
                    // and the branch host ip address is present in build_docker_hosts.

                        withDockerServer([uri:build_host_address]) {
                                def image = docker.build("abhinav12/myrep:mytag")
                                image.push()
                    }
                }
            }
        }

    }

}
