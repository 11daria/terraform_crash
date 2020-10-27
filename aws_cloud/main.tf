provider "aws" {
  access_key = "AKIA*******FLP6NOG"
  secret_key = "xOQww******v4yq9"
  region     = "us-west-2"	
}

resource "aws_instance" "u_ubuntu" {
  ami           = "ami-07a29e5e945228fa1"
  instance_type = "t2.micro"
  count = 2
  vpc_security_group_ids = ["aws_security_group.ports.id"]
}
resource "aws_security_group" "ports" {
  name        = "security group"
  description = "My security group"

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
}

