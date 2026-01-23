module "employee_app" {
  source         = "../../../modules/employee-app-cd"
  
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnet_id      = var.subnet_id
  environment    = var.environment
  desired_capacity = var.desired_capacity
  min_size       = var.min_size
  max_size       = var.max_size
}
