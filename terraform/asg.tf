#Template to launch autoscaling group using terraform

#Resource autoscaling group with name terraform_asg
#Variables are referenced from file asg-variables.tf


resource "aws_autoscaling_group" "terraform_asg" {
  availability_zones        = ["${var.asg_availability_zone}"]
  name                      = "${var.asg_name}"
  max_size                  = "${var.asg_max_size}"
  min_size                  = "${var.asg_min_size}"
  health_check_grace_period = "${var.asg_health_check}"
  health_check_type         = "${var.asg_health_check_type}"
  desired_capacity          = "${var.asg_desired_size}"
  load_balancers            = ["${aws_elb.terraform_elb.name}"]
  launch_configuration      = "${aws_launch_configuration.terraform_lc.name}"
  tags = [
{
    key                 = "Name"
    value               = "terraform_asg"
    propagate_at_launch = true
},

{
    key                 = "Launch_env"
    value               = "Terraform"
   propagate_at_launch = true
},
]
}
