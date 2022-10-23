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

resource "aws_vpc" "multi-tier_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "multi-tier_VPC"
  }
}

resource "aws_subnet" "three-tier_public_subnet1" {
  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.multi-tier_vpc.id
  availability_zone = "us-east-1a"
  tags = {
    Name = "three-tier_public_subnet1"
  }
  depends_on = [
    aws_vpc.multi-tier_vpc
  ]
}