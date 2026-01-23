@Library('terraform-shared-lib-cd@main') _

pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-terraform')
    AWS_SECRET_ACCESS_KEY = credentials('aws-terraform')
    AWS_DEFAULT_REGION    = 'ap-northeast-1'   // MUST match S3 bucket region
  }

  stages {
    stage('Init') {
      steps {
        terraformInit(path: 'src/terraform/wrapper')
      }
    }

    stage('Validate') {
      steps {
        terraformValidate(path: 'src/terraform/wrapper')
      }
    }

    stage('Plan') {
      steps {
        terraformPlan(path: 'src/terraform/wrapper', env: 'dev')
      }
    }

    stage('Approval') {
      steps {
        input message: 'Approve Terraform Apply?'
      }
    }

    stage('Apply') {
      steps {
        terraformApply(path: 'src/terraform/wrapper', env: 'dev')
      }
    }
  }
}
