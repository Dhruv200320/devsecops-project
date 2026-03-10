provider "aws" {
 region = "ap-south-1"
}

resource "aws_security_group" "web_sg" {
 name = "devsecops-sg"

 ingress {
   from_port = 22
   to_port = 22
   protocol = "tcp"

   cidr_blocks = ["0.0.0.0/0"]  # Intentional vulnerability
 }

 ingress {
   from_port = 3000
   to_port = 3000
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

resource "aws_instance" "web" {
 ami           = "ami-0e670eb768a5fc3d4"
 instance_type = "t3.micro"

 vpc_security_group_ids = [aws_security_group.web_sg.id]

 tags = {
   Name = "devsecops-instance"
 }
}