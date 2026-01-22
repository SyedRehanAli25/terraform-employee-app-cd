// Jenkinsfile for Employee App CD Only
@Library('terraform-shared-lib-cd@main') _

pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'us-east-1'
        TF_ENV = 'qa' // CD targets QA or higher
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
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

        stage('Approval') {
            steps {
                input message: "Approve Terraform Apply for ${env.TF_ENV}?"
            }
        }

        stage('Terraform Apply') {
            steps {
                terraformApply(path: 'src/terraform/wrapper', env: env.TF_ENV)
            }
        }

        stage('Post Apply') {
            steps {
                echo "CD pipeline completed successfully for ${env.TF_ENV} ✅"
            }
        }
    }

    post {
        success {
            echo "CD pipeline finished successfully ✅"
        }
        failure {
            echo "CD pipeline failed ❌"
        }
    }
}
