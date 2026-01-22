# Employee App cd Terraform wrapper outputs.tf
output "employee_instance_id" { value = module.employee_app.employee_instance_id }
output "employee_asg_id" { value = module.employee_app.employee_asg_id }
