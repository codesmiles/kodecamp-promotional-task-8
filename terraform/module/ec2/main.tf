provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "minikube" {
  ami           = var.ec2_var.ami
  instance_type = var.ec2_var.instance_type
  subnet_id     = var.ec2_var.subnet_id
  key_name      = var.ec2_var.key_name

  tags = {
    Name = "minikube-ec2"
  }

  vpc_security_group_ids = [aws_security_group.minikube_sg.id]

  user_data = file("${path.module}/shell.sh")
}

resource "aws_security_group" "minikube_sg" {
  vpc_id = var.ec2_var.vpc_id

  tags = {
    Name = "minikube_sg"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTPS from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }

}