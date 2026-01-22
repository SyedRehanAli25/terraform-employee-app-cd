@Library('terraform-shared-lib-ci@main') _

pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'us-east-1'
        TF_ENV                = 'dev'   // or 'qa' depending on branch/environment
    }

    options {
        skipDefaultCheckout(true) // We'll do a custom checkout
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/SyedRehanAli25/terraform-employee-app-ci.git'
            }
        }

        stage('Terraform Init') {
            steps {
                terraformInit(path: 'src/terraform/wrapper')
            }
        }

        stage('Terraform Validate') {
            steps {
                terraformValidate(path: 'src/terraform/wrapper')
            }
        }

        stage('Terraform Plan') {
            steps {
                terraformPlan(path: 'src/terraform/wrapper', env: env.TF_ENV)
            }
        }

        stage('Archive Plan') {
            steps {
                archiveArtifacts artifacts: '**/*.tfplan', allowEmptyArchive: true
            }
        }
    }

    post {
        success {
            echo "CI Pipeline completed successfully."
        }
        failure {
            echo "CI Pipeline failed. Check logs."
        }
    }
}
