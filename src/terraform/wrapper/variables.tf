# Employee App cd Terraform wrapper variables.tf
variable "ami_id" { type = string }
variable "instance_type" { type = string }
variable "subnet_id" { type = string }
variable "environment" { type = string }
variable "desired_capacity" {}
variable "min_size" {}
variable "max_size" {}
