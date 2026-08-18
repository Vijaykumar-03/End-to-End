module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "devops-eks"
  cluster_version = "1.33"

  vpc_id     = data.aws_vpc.default.id
  subnet_ids = var.subnet_ids

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    worker = {
      instance_types = ["m7i-flex.large"]

      min_size     = 1
      desired_size = 5
      max_size     = 5

      capacity_type = "ON_DEMAND"
    }
  }

  tags = {
    Environment = "Dev"
    Terraform   = "true"
  }
}

data "aws_vpc" "default" {
  default = true
}
