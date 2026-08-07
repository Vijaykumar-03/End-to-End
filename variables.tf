##########################################################
# AWS Region
##########################################################

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-2"
}

##########################################################
# ECR Repository Name
##########################################################

variable "repository_name" {
  description = "ECR Repository Name"
  type        = string
  default     = "devops-ecr"
}

##########################################################
# EKS Cluster Name
##########################################################

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "devops-eks"
}
