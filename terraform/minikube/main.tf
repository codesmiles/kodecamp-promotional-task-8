terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "minikube" {
  ami           = "ami-08575e3ae35f313a6" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  key_name      = "promotional-task-key-pair"

  tags = {
    Name = "Minikube-Instance"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install docker -y",
      "sudo service docker start",
      "sudo usermod -a -G docker ec2-user",
      "curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64",
      "chmod +x minikube",
      "sudo mv minikube /usr/local/bin/",
      "minikube start --driver=none",
      "curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl",
      "chmod +x kubectl",
      "sudo mv kubectl /usr/local/bin/"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/promotional-task-key-pair.pem")
      host        = self.public_ip
    }
  }
}