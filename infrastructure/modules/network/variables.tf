variable "zone_a_jenkins_cidr_block" {
  type    = string
  default = "10.16.0.0/27"
}

variable "zone_a_monitoring_cidr_block" {
  type    = string
  default = "10.16.0.32/27"
}

variable "zone_a" {
  type = string
}