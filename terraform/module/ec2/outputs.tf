output "minikube_id" {
  value = aws_instance.minikube.id
}

output "minikube_public_ip" {
    value = aws_instance.minikube.public_ip
}

output "security_group_id" {
  value = aws_security_group.minikube_sg.id
}