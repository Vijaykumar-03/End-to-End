variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-2"
}

variable "ecr_repository_name" {
  description = "ECR Repository Name"
  type        = string
  default     = "devops-ecr"
}

variable "ec2_instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

variable "eks_cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "devops-eks"
}

variable "eks_cluster_version" {
  description = "EKS Version"
  type        = string
  default     = "1.33"
}

variable "node_instance_type" {
  description = "EKS Worker Node Instance Type"
  type        = string
  default     = "t3.micro"
}

variable "desired_size" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 1
}

variable "lambda_function_name" {
  description = "Lambda Function Name"
  type        = string
  default     = "user-registration"
}
