variable "vpc_cidr"
{
description = "The CIDR of the VPC"
}

variable "aws_region"
{
description = "The name of the aws region"
}

variable "aws_profile"
{
description = "The name of the aws profile"
}

variable "subnet1_cidr"
{
description = "The CIDR of the subnet"
}

variable "subnet1_az"
{
default = "us-west-2a"
description = "The availability zone for the subnet1"
}


variable "subnet2_cidr"
{
description = "The CIDR of the subnet"
}

variable "subnet2_az"
{
default = "us-west-2b"
description = "The availability zone for the subnet2"
}

variable "subnet3_cidr"
{
description = "The CIDR of the subnet"
}

variable "subnet3_az"
{
default = "us-west-2c"
description = "The availability zone for the subnet2"
}

variable "key_name"
{
default = "cwStage"
description = "The pem file to be used"
}

