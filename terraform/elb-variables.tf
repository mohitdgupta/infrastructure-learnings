variable "elb_name"
{
description = "The name of the ELB instance"
default = "terraform-elb"
}

variable "elb_availability_zones"
{
description = "The name of the ELB availability zone"
default = "us-west-2a"
}

variable "elb_healthy_threshold"
{
description = "The healthy threshold of ELB"
default = "2"
}

variable "elb_unhealthy_threshold"
{
description = "The unhealthy threshold of ELB"
default = "2"
}

variable "elb_timeout_interval"
{
description = "The timeout interval of ELB"
default = "3"
}

variable "elb_interval"
{
description = "The check interval of ELB"
default = "30"
}

variable "elb_idle_timeout"
{
description = "The idle timeout of ELB"
default = "300"
}

variable "elb_connection_draining"
{
description = "The boolean value"
default = "true"
}

variable "elb_connection_draining_timeout"
{
description = "The timeout value"
default = "300"
}
