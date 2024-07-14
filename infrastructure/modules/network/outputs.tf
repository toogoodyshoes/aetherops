output "vpc_id" {
  value = aws_vpc.ci_cd.id
}

output "zone_a_subnet_id" {
  value = aws_subnet.jenkins_zone_a.id
}

output "zone_a_monitoring_subnet_id" {
  value = aws_subnet.zone_a_monitoring.id
}