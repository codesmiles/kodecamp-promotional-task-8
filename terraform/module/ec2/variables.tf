variable "ami" {
    type = string
    default = ""
    description = ""
}
variable "instance_type" {
    type = string
    default = "t2.medium"
    description = ""
}

variable "subnet_id" {
    type = string
    default = ""
    description = ""
}

variable "key_name" {
    type = string
    default = ""
    description = ""
}

variable "vpc_id" {
    type = string
    default = ""
    description = ""
  
}
variable "security_group" {
    type = string
    default = ""
    description = ""
  
}