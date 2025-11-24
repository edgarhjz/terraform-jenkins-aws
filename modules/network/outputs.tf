output "subnet_id" {
  value = aws_subnet.jenkins_public_subnet.id
}

output "security_group_id" {
  value = aws_security_group.jenkins_sg.id
}
