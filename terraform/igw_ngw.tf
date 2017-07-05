resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = "${aws_vpc.terraform_vpc.id}"

  tags {
    Name = "terraform_igw"
  }
}

resource "aws_eip" "ip" {
}

resource "aws_nat_gateway" "terraform_ngw1" {
  allocation_id = "${aws_eip.ip.id}"
  subnet_id     = "${aws_subnet.terraform_subnet1.id}"
}
