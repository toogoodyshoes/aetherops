terraform {
  cloud {
    organization = "nile_org"
    workspaces {
      name = "jenkins-infrastructure"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.56.1"
    }
  }
}
