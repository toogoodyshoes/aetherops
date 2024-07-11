output "jenkins_controller_public_ip" {
  description = "Jenkins Controller Public IP"
  value       = module.compute.jenkins_controller_public_ip
}

output "nginx_reverse_proxy_public_ip" {
  description = "Nginx Reverse Proxy Public IP"
  value = module.compute.reverse_proxy_public_ip
}