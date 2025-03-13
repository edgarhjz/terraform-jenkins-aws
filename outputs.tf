output "public_ip" {
  value       = aws_instance.jenkins.public_ip
  description = "Jenkins server public IP address"
}

output "jenkins_url" {
  value       = "http://${aws_instance.jenkins.public_ip}:8080"
  description = "Jenkins URL"
}
