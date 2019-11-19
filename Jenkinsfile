def ci_branches = ['master']
def build_host_address = 'tcp://192.168.99.102:2376'

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

    stage('Container Deploy') {
            steps {
                script {
                    if ((ci_branches.contains(env.BRANCH_NAME)) {
                        withDockerServer([uri:build_host_address]) {
                            def requirements_file_result = sh(returnStdout: true,script: 'git diff-tree --name-only $GIT_PREVIOUS_COMMIT $GIT_COMMIT')
                            if(requirements_file_result.contains("requirements.txt")) {
                                docker.script.sh(script: "docker exec -i app-production pip install -U -r /app/requirements.txt" )
                            }
                            docker.script.sh(script: "docker cp $env.WORKSPACE/. app-production:/app")
                            docker.script.sh(script: "docker exec -i app-production bash -c 'chown -R root:root /app'")
                            docker.script.sh(script: "docker restart app-production")
                        }
                    }
                }
            }
        }
    }
}

