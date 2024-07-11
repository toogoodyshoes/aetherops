output "jenkins_controller_public_ip" {
  description = "Jenkins Controller Public IP"
  value       = module.compute.jenkins_controller_public_ip
}