data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "ecr" {
  source = "./modules/ecr"

  repository_name = "devops-ecr"
}

module "ec2" {

  source = "./modules/ec2"

  subnet_id = data.aws_subnets.default.ids[0]

}

module "eks" {

  source = "./modules/eks"

  subnet_ids = data.aws_subnets.default.ids

}

module "lambda" {

  source = "./modules/lambda"

}
