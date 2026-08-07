##########################################################
# Get Latest Ubuntu 22.04 AMI
##########################################################

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

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

  ami           = data.aws_ami.ubuntu.id
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
