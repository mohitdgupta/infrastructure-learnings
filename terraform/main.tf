provider "aws" {
region = "${var.aws_region}"
shared_credentials_file = "/Users/mohit/.aws/credentials"
profile                 = "${var.aws_profile}"
}


resource "aws_vpc" "terraform_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags {
    Name = "terraform_vpc"
  }
}

