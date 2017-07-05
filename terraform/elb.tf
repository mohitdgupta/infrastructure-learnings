#Terraform template to launch ELB
# Resource elb with reference id terraform_elb
# Variables are referenced from file elb-variables.tf

resource "aws_elb" "terraform_elb" {
 name         = "${var.elb_name}"
 availability_zones = ["${var.elb_availability_zones}"]

listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

health_check {
    healthy_threshold   = "${var.elb_healthy_threshold}"
    unhealthy_threshold = "${var.elb_unhealthy_threshold}"
    timeout             = "${var.elb_timeout_interval}"
    target              = "TCP:22"
    interval            = "${var.elb_interval}"
  }

  idle_timeout                = "${var.elb_idle_timeout}"
  connection_draining         = "${var.elb_connection_draining}"
  connection_draining_timeout = "${var.elb_connection_draining_timeout}"

tags {
    Name = "terraform-elb"
  }
}
