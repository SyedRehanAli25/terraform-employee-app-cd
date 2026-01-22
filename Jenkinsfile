@Library('terraform-shared-lib-cd@main') _

pipeline {
  agent any

  stages {
    stage('Init') { steps { terraformInit(path: 'src/terraform/wrapper') } }
    stage('Validate') { steps { terraformValidate(path: 'src/terraform/wrapper') } }
    stage('Plan') { steps { terraformPlan(path: 'src/terraform/wrapper', env: 'dev') } }
    stage('Approval') { steps { input message: 'Approve Terraform Apply?' } }
    stage('Apply') { steps { terraformApply(path: 'src/terraform/wrapper', env: 'dev') } }
  }
}
