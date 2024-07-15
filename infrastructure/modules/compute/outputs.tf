output "jenkins_controller_public_ip" {
  value = aws_instance.jenkins_controller.public_ip
}

output "jenkins_controller_private_ip" {
  value = aws_instance.jenkins_controller.private_ip
}

output "reverse_proxy_public_ip" {
  value = aws_instance.reverse_proxy.public_ip
}

output "prometheus_reverse_proxy_public_ip" {
  value = aws_instance.reverse_proxy_monitoring.public_ip
}

output "prometheus_server_public_ip" {
  value = aws_instance.prometheus_server.public_ip
}