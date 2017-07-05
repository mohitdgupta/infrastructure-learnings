variable "asg_name"
{
default = "terraform-asg"
description = "The name of the autoscaling group"
}

variable "asg_availability_zone"
{
default = "us-west-2a"
description = "The availability zone of asg"
}

variable "asg_max_size"
{
default = "1"
description = "The maximum number of autscaling instances"
}

variable "asg_min_size"
{
default = "1"
description = "The minimum number of autscaling instances"
}

variable "asg_desired_size"
{
default = "1"
description = "The desired number of autscaling instances"
}

variable "asg_health_check_type"
{
default = "EC2"
description = "The health check type EC2 or ELB"
}

variable "asg_health_check"
{
default = "300"
description = "The health check grace period"
}
