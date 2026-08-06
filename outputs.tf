output "ec2_ip" {

  value = module.ec2.public_ip

}

output "ecr_url" {

  value = module.ecr.repository_url

}

output "eks_name" {

  value = module.eks.cluster_name

}

output "lambda_name" {

  value = module.lambda.lambda_name

}
