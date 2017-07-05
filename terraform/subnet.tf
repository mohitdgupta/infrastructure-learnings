#Terraform template to launch subnets
# Three subnets are launched
# Variables are referenced from file variables.tf


resource "aws_subnet" "terraform_subnet1" {
  vpc_id     = "${aws_vpc.terraform_vpc.id}"
  cidr_block = "${var.subnet1_cidr}"
  availability_zone = "${var.subnet1_az}"
  tags {
    Name = "terraform_subnet1"
  }
}

resource "aws_subnet" "terraform_subnet2" {
  vpc_id     = "${aws_vpc.terraform_vpc.id}"
  cidr_block = "${var.subnet2_cidr}"
  availability_zone = "${var.subnet2_az}"
  tags {
    Name = "terraform_subnet2"
  }
}

resource "aws_subnet" "terraform_subnet3" {
  vpc_id     = "${aws_vpc.terraform_vpc.id}"
  cidr_block = "${var.subnet3_cidr}"
  availability_zone = "${var.subnet3_az}"
  tags {
    Name = "terraform_subnet3"
  }
}
