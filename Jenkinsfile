def ci_branches = ['master','abhinav']
def build_host_address = 'tcp://192.168.99.102:2376'
def my_branch = "master"

pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                script {
//                     if (ci_branches.contains("master")) {
                        checkout scm
//                     }

                }
            }
        }

         stage('Update SubModules') {
            steps {
                script {
                    sh "git submodule update --init --recursive && git submodule foreach git checkout master && git submodule foreach git pull"
                }
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    // Build the docker image if and only if the branch name is present in ci_branches
                    // and the branch host ip address is present in build_docker_hosts.
//                     withDockerServer([uri:'tcp://192.168.99.104:2375']) {
                        sh "ls -la"
//                         docker.script.sh(script: "docker build -t mynewimage ..")
                        def image = docker.build("mylatestimage")
                        image.push()

//                         docker.script.sh(script: "sudo docker build -t mynewimage .")
//                     }

                }
//                         withDockerServer([uri:build_host_address]) {
//                                sh "ls -l"
//                             docker.script.sh(script: "docker push abhinav12/myrepo:${env.BRANCH_NAME}")
//                             withDockerRegistry([credentialsId: 'abhinav12']) {
//                                 def image = docker.build("abhinav12/myrepo:${env.BRANCH_NAME}")
//                                 image.push()
//                             }
//                        }
//               docker.script.sh(script: "docker build -t abhinav12/myrepo:${env.BRANCH_NAME} .")
//                         docker.script.sh(script: "docker push abhinav12/myrepo:${env.BRANCH_NAME}")
            }
        }
//
//         stage('Build') {
//             steps {
//                 script {
//                     if (ci_branches.contains(env.BRANCH_NAME)) {
//                         withDockerServer([uri:build_host_address]) {
//                             def requirements_file_result = sh(returnStdout: true,script: 'git diff-tree --name-only $GIT_PREVIOUS_COMMIT $GIT_COMMIT')
//                             if(requirements_file_result.contains("requirements.txt")) {
//                                 docker.script.sh(script: "docker exec -i app pip install -U -r /app/requirements.txt" )
//                             }
// //                                docker.script.sh(script: "docker cp $env.WORKSPACE/. app-production:/app")
// //                                docker.script.sh(script: "docker exec -i app-production bash -c 'chown -R root:root /app'")
// //                                docker.script.sh(script: "docker restart app-production")
//
//                         }
//                     }
//                 }
//             }
//         }
    }
}

