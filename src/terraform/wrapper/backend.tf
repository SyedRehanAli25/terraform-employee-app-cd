# Employee App cd Terraform backend.tf
terraform {
  backend "s3" {
    bucket = "wrap-terraform-state"
    key    = "employee-app-cd/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
