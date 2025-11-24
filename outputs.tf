output "jenkins_url" {
  value       = "http://${module.machines.instance_public_ip}:8080"
  description = "Jenkins URL"
}
