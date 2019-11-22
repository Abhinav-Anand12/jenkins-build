def ci_branches = ['master','abhinav']
def build_host_address = 'tcp://127.0.0.1:2376'

pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                script {
                    if (ci_branches.contains(env.BRANCH_NAME)) {
                        checkout scm
                    }

                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    // Build the docker image if and only if the branch name is present in ci_branches
                    // and the branch host ip address is present in build_docker_hosts.
                    if (ci_branches.contains(env.BRANCH_NAME)) {
                        withDockerServer([uri:build_host_address]) {
//                             docker.script.sh(script: "docker push abhinav12/myrepo:${env.BRANCH_NAME}")
                            withDockerRegistry([credentialsId: 'abhinav12']) {
                                def image = docker.build("abhinav12/myrepo:${env.BRANCH_NAME}")
                                image.push()
                            }
                        }
                    }
                }
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

