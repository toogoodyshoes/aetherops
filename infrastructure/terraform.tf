terraform {
  backend "s3" {
    bucket         = "jenkins-statefile"
    key            = "jenkins/terraform.tfstate"
    dynamodb_table = "jenkins-terraform-state-locking"
    region         = "ap-south-1"
    profile        = "jenkins"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.56.1"
    }
  }
}
