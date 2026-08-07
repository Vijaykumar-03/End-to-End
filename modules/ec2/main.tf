##########################################################
# Default VPC
##########################################################

data "aws_vpc" "default" {
  default = true
}

##########################################################
# Security Group
##########################################################

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Security Group for EC2"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-sg"
  }
}

##########################################################
# EC2 Instance
##########################################################

resource "aws_instance" "server" {

  # Ubuntu 24.04 LTS (ap-south-2)
  ami           = "ami-001af333c5cf65178"

  instance_type = "t3.micro"

  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  tags = {
    Name = "Terraform-EC2"
  }
}
