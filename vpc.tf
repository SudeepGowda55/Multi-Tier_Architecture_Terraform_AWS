terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.36.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "multitier_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "multi-tier VPC"
  }
}