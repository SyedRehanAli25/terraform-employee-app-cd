# Employee App cd module main.tf
resource "aws_instance" "employee_app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  tags = {
    Name        = "employee-app-ec2"
    Application = "employee-app"
    Environment = var.environment
  }
}
