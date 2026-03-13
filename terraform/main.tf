provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "web_sg" {
  name        = "devsecops-sg"
  description = "Security group for DevSecOps project"

  ingress {
    description = "Allow SSH only from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = ["203.192.238.93/32"]
  }

  ingress {
    description = "Allow web application"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow HTTPS outbound"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0e670eb768a5fc3d4"
  instance_type = "t3.micro"
  key_name = "devsecops-key"

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    encrypted = true
  }

  tags = {
    Name = "devsecops-instance"
  }
}