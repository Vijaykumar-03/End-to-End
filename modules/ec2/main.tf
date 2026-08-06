data "aws_ami" "ubuntu" {

  most_recent = true

  owners = ["732231074251"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

}

resource "aws_security_group" "ec2" {

  name = "ec2-sg"

  ingress {

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}

resource "aws_instance" "server" {

  ami = data.aws_ami.ubuntu.id

  instance_type = "t3.micro"

  subnet_id = var.subnet_id

  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.ec2.id
  ]

  tags = {
    Name = "Terraform-EC2"
  }

}
