terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "vpc" {
  source            = "./module/vpc"
  vpc_cidr          = "10.0.0.0/16"
  vpc_name          = "promotional_task_8"
  availability_zone = "eu-west-1a"
}

module "ec2" {
  source = "./module/ec2"
  ec2_var = {
    ami           = "ami-0c38b837cd80f13bb"
    vpc_id        = module.vpc.aws_vpc_id
    key_name      = "task-8"
    subnet_id     = module.vpc.aws_subnet_id
    instance_type = "t2.medium"
  }
}   
