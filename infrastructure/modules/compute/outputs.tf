output "jenkins_controller_public_ip" {
  value = aws_instance.jenkins_controller.public_ip
}

output "reverse_proxy_public_ip" {
  value = aws_instance.reverse_proxy.public_ip
}