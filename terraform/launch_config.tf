#Terraform template to create launch configuration
# Resource launch config with reference id terraform_lc
# Variables are referenced from file lc-variables.tf


resource "aws_launch_configuration" "terraform_lc" {
  name_prefix   = "${var.lc_name}"
  image_id      = "${var.lc_image}"
  instance_type = "${var.lc_instance_type}"
  security_groups = ["${aws_security_group.app.id}"]
  user_data       = "${file("userdata.sh")}"
  key_name        = "${var.key_name}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "app" {
  name        = "terraform_example_sg"
  description = "Used in the terraform"

  # SSH access from myIP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["182.16.12.20/32"]
  }


  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
