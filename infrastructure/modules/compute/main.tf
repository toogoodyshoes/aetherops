resource "aws_security_group" "jenkins_controller" {
  name   = "jenkins-controller"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_egress_rule" "anywhere" {
  security_group_id = aws_security_group.jenkins_controller.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "jenkins_service" {
  security_group_id = aws_security_group.jenkins_controller.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 8080
  to_port           = 8080
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.jenkins_controller.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_instance" "jenkins_controller" {
  ami                         = var.amazon_linux
  instance_type               = var.instance_type
  key_name                    = "jenkins_controller"
  subnet_id                   = var.zone_a_subnet_id
  vpc_security_group_ids      = [aws_security_group.jenkins_controller.id]
  associate_public_ip_address = true

  tags = {
    Name = "Jenkins Controller"
  }
}
