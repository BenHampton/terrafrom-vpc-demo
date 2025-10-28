terraform {
  cloud {
    organization = "hashicorp-learn-aws-org"

    workspaces {
      project = "Terraform AWS VPC Demo"
      name    = "terraform-aws-vpc-demo"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2.0"
}

#Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}
