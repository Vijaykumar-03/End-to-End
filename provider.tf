provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "End-to-End"
      Environment = "Dev"
      ManagedBy   = "Terraform"
    }
  }
}
