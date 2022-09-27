terraform {
  required_version = "~> 1.1" # which means any version equal & above 1.1 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default"
  region  = var.aws_region
}