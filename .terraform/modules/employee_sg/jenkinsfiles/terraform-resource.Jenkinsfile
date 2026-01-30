pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = 'true'
        AWS_DEFAULT_REGION = 'us-east-1'
    }

    stages {

        stage('Checkout Terraform Code') {
            steps {
                git branch: params.GIT_BRANCH,
                    url: 'https://github.com/Snaatak-Downtime-Rakshak/Terraform.git',
                    credentialsId: 'github-pat'
            }
        }

        stage('Cleanup') {
          steps {
            sh '''
                rm -rf .terraform
                rm -rf .terraform.lock.hcl
            '''
          }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws_creds_1']
                ]) {
                    dir(params.TF_PATH) {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            when {
                expression { params.ACTION == 'plan' || params.ACTION == 'apply' }
            }
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws_creds_1']
                ]) {
                    dir(params.TF_PATH) {
                        sh 'terraform plan'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression { params.ACTION == 'apply' }
            }
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws_creds_1']
                ]) {
                    dir(params.TF_PATH) {
                        sh '''
                          export TF_VAR_env=$(echo "$ENV" | tr '[:upper:]' '[:lower:]')
                          terraform apply -auto-approve
                        '''
                    }
                }
            }
        }

        stage('Confirm Destroy') {
            when {
                expression { params.ACTION == 'destroy' }
            }
            steps {
                input message: '⚠️ Are you sure you want to DESTROY this infrastructure?'
            }
        }

        stage('Terraform Destroy') {
            when {
                expression { params.ACTION == 'destroy' }
            }
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws_creds_1']
                ]) {
                    dir(params.TF_PATH) {
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
}
