output "jenkins_controller_public_ip" {
  description = "Jenkins Controller Public IP"
  value       = module.compute.jenkins_controller_public_ip
}

output "jenkins_controller_private_ip" {
  description = "Jenkins Controller Private IP"
  value       = module.compute.jenkins_controller_private_ip
}

output "nginx_reverse_proxy_public_ip" {
  description = "Nginx Reverse Proxy Public IP"
  value       = module.compute.reverse_proxy_public_ip
}

output "prometheus_reverse_proxy_public_ip" {
  description = "Prometheus Reverse Proxy Public IP"
  value = module.compute.prometheus_reverse_proxy_public_ip
}

output "prometheus_server_public_ip" {
  description = "Prometheus Server Public IP"
  value = module.compute.prometheus_server_public_ip
}

output "prometheus_server_private_ip" {
  description = "Prometheus Server Private IP"
  value = module.compute.prometheus_server_private_ip
}