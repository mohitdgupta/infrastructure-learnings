#Terraform template to launch route tables
# Route tables are created along with their association
# Variables are referenced from file variables.tf


resource "aws_route_table" "route_table_1a" {
 vpc_id     = "${aws_vpc.terraform_vpc.id}"
 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.terraform_igw.id}"
  }
 tags {
    Name = "Route_table_1a"
  }
}


resource "aws_route_table" "route_table_1b" {
 vpc_id     = "${aws_vpc.terraform_vpc.id}"
 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.terraform_ngw1.id}"
  }
 tags {
    Name = "Route_table_1b"
  }
}

resource "aws_route_table" "route_table_1c" {
 vpc_id     = "${aws_vpc.terraform_vpc.id}"
 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.terraform_ngw1.id}"
  }
 tags {
    Name = "Route_table_1c"
  }
}



resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.terraform_subnet1.id}"
  route_table_id = "${aws_route_table.route_table_1a.id}"
}

resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.terraform_subnet2.id}"
  route_table_id = "${aws_route_table.route_table_1b.id}"
}

resource "aws_route_table_association" "c" {
  subnet_id      = "${aws_subnet.terraform_subnet3.id}"
  route_table_id = "${aws_route_table.route_table_1c.id}"
}
