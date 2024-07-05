output "vpc_id" {
  value = aws_vpc.ci_cd.ic
}

output "zone_a_subnet_id" {
  value = aws_subnet.jenkins_zone_a.id
}