def readTrigerFile(String eventType) {
    def fileContent = readFile file "${WORKSPACE}\trigger.yml"
    println fileContent
}

pipeline {
    agent any

    tools {
        terraform 'terraform'
    }

    // parameters {
    //     string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
    //     booleanParam(name: 'autoApprove', defaultValue: true, description: 'Automatically run apply after generating plan?')
    //     booleanParam(name: 'destroy', defaultValue: false, description: 'Destroy Terraform build?')
    // }

    environment {
        AWS_REGION = 'us-east-1'
        AWS_DEFAULT_REGION = 'us-east-1'
    }

    stages {
        stage('checkout') {
            steps {
                script {
                    dir('terraform') {
                        // Get some code from a GitHub repository
                        git url: 'https://github.com/abdulkhadar-Capgemini/JupyterLab.git', branch: 'main', credentialsId: 'github_creds'
                    }
                }
            }
        }
        stage('Plan') {
            steps {
                script {
                    dir('src') {
                        bat 'terraform init'
                        bat 'terraform plan'
                    }
                }
            }
        }
        stage('Apply') {
            when {
                allOf {
                    changeset 'trigger*'
                }
            }

            steps {
                script {
                    dir('src') {
                        bat 'terraform apply --auto-approve'
                    }
                }
            }
        }
        stage('Destroy') {
            when {
                allOf {
                    changeset 'delete*'
                }
            }

            steps {
                dir('src') {
                    bat 'terraform destroy --auto-approve'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
