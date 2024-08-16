
variable "ec2_var" {
  description = "a list of maps defining the ec2 configuration"
  type = object({
    ami            = string
    vpc_id         = string
    key_name       = string
    subnet_id      = string
    instance_type  = string
  })
}
