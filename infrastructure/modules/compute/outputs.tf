output "jenkins_controller_public_ip" {
  value = aws_instance.jenkins_controller.public_ip
}