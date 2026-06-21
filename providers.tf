terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 1.5"
    }
  }
  backend "s3" {
    bucket         = "my-tf-test-bucket-terraform-2026"
    key            = "vpc/terraform.tfstate"
    region         = "ap-south-1"
    use_lockfile = true
  }
}

provider "aws" {
  region = "ap-south-1"
}
