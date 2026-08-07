module "eks" {

  source = "terraform-aws-modules/eks/aws"

  version = "~>20.0"

  cluster_name = "devops-eks"

  cluster_version = "1.33"

  subnet_ids = var.subnet_ids

  vpc_id = data.aws_vpc.default.id

  eks_managed_node_groups = {

    worker = {

      instance_types = ["t3.micro"]

      desired_size = 2

      min_size = 1

      max_size = 3

    }

  }

}

data "aws_vpc" "default" {

  default = true

}
