##########################################################
# Default VPC
##########################################################

data "aws_vpc" "default" {
  default = true
}

##########################################################
# Default Subnets
##########################################################

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

##########################################################
# EC2 Module
##########################################################

module "ec2" {
  source = "./modules/ec2"

  subnet_id = data.aws_subnets.default.ids[0]
}

##########################################################
# ECR Module
##########################################################

module "ecr" {
  source = "./modules/ecr"

  repository_name = "devops-ecr"
}

##########################################################
# EKS Module
##########################################################

module "eks" {
  source = "./modules/eks"

  subnet_ids = data.aws_subnets.default.ids
}

##########################################################
# Lambda Module
##########################################################

module "lambda" {
  source = "./modules/lambda"
}
