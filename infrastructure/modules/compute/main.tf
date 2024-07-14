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


resource "aws_security_group" "reverse_proxy" {
  name   = "nginx-reverse-proxy"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_egress_rule" "reverse_proxy_anywhere" {
  security_group_id = aws_security_group.reverse_proxy.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "reverse_proxy_nginx" {
  security_group_id = aws_security_group.reverse_proxy.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "reverse_proxy_ssh" {
  security_group_id = aws_security_group.reverse_proxy.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "reverse_proxy_https" {
  security_group_id = aws_security_group.reverse_proxy.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}

resource "aws_instance" "reverse_proxy" {
  ami                         = var.amazon_linux
  instance_type               = var.instance_type
  key_name                    = "nginx_reverse_proxy"
  subnet_id                   = var.zone_a_subnet_id
  vpc_security_group_ids      = [aws_security_group.reverse_proxy.id]
  associate_public_ip_address = true

  tags = {
    Name = "Nginx Reverse Proxy"
  }
}


resource "aws_security_group" "reverse_proxy_prometheus" {
  name   = "prometheus-reverse-proxy"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_egress_rule" "reverse_proxy_prometheus_anywhere" {
  security_group_id = aws_security_group.reverse_proxy_prometheus.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "reverse_proxy_prometheus" {
  security_group_id = aws_security_group.reverse_proxy_prometheus.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "reverse_proxy_prometheus_ssh" {
  security_group_id = aws_security_group.reverse_proxy_prometheus.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "monitoring_https" {
  security_group_id = aws_security_group.reverse_proxy_prometheus.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}

resource "aws_instance" "reverse_proxy_monitoring" {
  ami                         = var.amazon_linux
  instance_type               = var.instance_type
  key_name                    = "monitoring_reverse_proxy"
  subnet_id                   = var.zone_a_monitoring_subnet_id
  vpc_security_group_ids      = [aws_security_group.reverse_proxy_prometheus.id]
  associate_public_ip_address = true

  tags = {
    Name = "Monitoring Reverse Proxy"
  }
}


resource "aws_security_group" "prometheus_server" {
  name   = "prometheus_server"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_egress_rule" "prometheus_server_anywhere" {
  security_group_id = aws_security_group.prometheus_server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "prometheus_server_ssh" {
  security_group_id = aws_security_group.prometheus_server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "prometheus_service" {
  security_group_id = aws_security_group.prometheus_server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 9090
  to_port           = 9090
}

resource "aws_vpc_security_group_ingress_rule" "grafana_service" {
  security_group_id = aws_security_group.prometheus_server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 3000
  to_port           = 3000
}

resource "aws_instance" "prometheus_server" {
  ami                         = var.amazon_linux
  instance_type               = var.instance_type
  key_name                    = "prometheus_server"
  subnet_id                   = var.zone_a_monitoring_subnet_id
  vpc_security_group_ids      = [aws_security_group.prometheus_server.id]
  associate_public_ip_address = true

  tags = {
    Name = "Prometheus Server"
  }
}