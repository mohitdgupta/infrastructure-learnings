variable "lc_name"
{
description = "The name of the Launch config"
default = "terraform-elb"
}

variable "lc_image"
{
description = "The ami id of the launch config"
default = "ami-d94f5aa0"
}

variable "lc_instance_type"
{
description = "The instance type"
default = "t2.nano"
}
