# Terraform Block
terraform {
  required_version = ">= 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-on-aws-for-ec2" # Bucket name: terraform-on-aws-for-ec2. Bucket settings for Block Public Access: leave to defaults
    key    = "dev/project1-vpc/terraform.tfstate" # Bucket Versioning: Enable
    region = "us-east-1" 

    # Enable during Step-09     
    # For State Locking
    dynamodb_table = "dev-project1-vpc"    # Partition key (Primary Key): LockID (Type as String)
  }    
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/