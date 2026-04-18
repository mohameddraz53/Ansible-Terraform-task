# module "vpc" {
#   source  = "Task2/Modules/vpc/"
#   version = "6.0.1"
# }
# module "Ec2" {
#   source  = "Task2/Terraform/Modules/EKS/"
#   version = "6.0.1"
# }
# module "vpc" {
#   source  = "Task2/Terraform/Modules/EC2/"
#   version = "6.0.1"
# }
# module "vpc" {
#   source  = "Task2/Terraform/Modules/S3/"
#   version = "6.0.1"
# }
# resource "aws_subnet" "main" {
#   vpc_id     = module.vpc.vpc_id
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "Main"
#   }
# }
# etc.....
