module "ecr" {
  source = "./modules/ecr"

  repository_name = var.repository_name
}

module "ec2" {
  source = "./modules/ec2"

  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.public_subnets[0]
  vpc_id = var.vpc_id
}

module "eks" {
  source = "./modules/eks"

  cluster_name = var.cluster_name
  subnet_ids = var.private_subnets
}

module "lambda" {
  source = "./modules/lambda"

  function_name = "user-registration"
}
