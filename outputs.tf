##########################################################
# EC2 Outputs
##########################################################

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "ec2_public_dns" {
  value = module.ec2.public_dns
}

##########################################################
# ECR Outputs
##########################################################

output "ecr_repository_name" {
  value = module.ecr.repository_name
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

##########################################################
# EKS Outputs
##########################################################

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

##########################################################
# Lambda Outputs
##########################################################

output "lambda_function_name" {
  value = module.lambda.lambda_function_name
}

output "lambda_arn" {
  value = module.lambda.lambda_arn
}
