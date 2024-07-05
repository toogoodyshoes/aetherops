resource "aws_vpc" "ci_cd" {
  cidr_block = "10.16.0.0/24"

  tags = {
    Name = "CI/CD VPC"
  }
}

resource "aws_internet_gateway" "ci_cd" {
  vpc_id = aws_vpc.ci_cd.id

  tags = {
    Name = "CI/CD Internet Gateway"
  }
}

resource "aws_subnet" "jenkins_zone_a" {
  vpc_id               = aws_vpc.ci_cd.id
  cidr_block           = var.zone_a_jenkins_cidr_block
  availability_zone_id = var.zone_a

  tags = {
    Name = "Jenkins Zone A"
  }
}

resource "aws_route_table" "jenkins" {
  vpc_id = aws_vpc.ci_cd.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ci_cd.id
  }

  tags = {
    Name = "Jenkins Route Table"
  }
}

resource "aws_route_table_association" "jenkins_zone_a" {
  route_table_id = aws_route_table.jenkins.id
  subnet_id      = aws_subnet.jenkins_zone_a.id
}