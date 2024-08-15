output "aws_vpc_id" {
    value = aws_vpc.main.id
}

output "aws_subnet_id" {
  value = aws_subnet.public.id
}

output "aws_internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}