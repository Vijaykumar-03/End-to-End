variable "region" {
  default = "ap-south-2"
}

variable "cluster_name" {
  default = "devops-eks"
}

variable "repository_name" {
  default = "devops-ecr"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "vpc_id" {}
