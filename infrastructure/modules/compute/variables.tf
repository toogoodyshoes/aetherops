variable "vpc_id" {
  type = string
}

variable "amazon_linux" {
  type    = string
  default = "ami-0f58b397bc5c1f2e8"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "zone_a_subnet_id" {
  type = string
}