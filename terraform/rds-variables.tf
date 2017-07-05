variable "rds_allocated_storage"
{
default = "10"
description = "The allocated storage to RDS DB instance"
}

variable "rds_storage_type"
{
default = "gp2"
description = "The allocated storage to RDS DB instance"
}

variable "rds_engine"
{
default = "mysql"
description = "The allocated storage to RDS DB instance"
}

variable "rds_engine_version"
{
default = "5.6.34"
description = "The engine version RDS DB instance"
}

 variable "rds_instance_class"
{
default = "db.t2.micro"
description = "The RDS DB instance type"
}

 variable "rds_name"
{
default = "terraform_rds"
description = "The name of RDS DB instance"
}

 variable "rds_username"
{
default = "root"
description = "The username of RDS DB instance"
}

 variable "rds_password"
{
default = "rootroot"
description = "The password of RDS DB instance"
}

  variable "rds_subnet_group"
{
default = "default"
description = "The subnet group of RDS DB instance"
}

 variable "rds_parameter_group"
{
default = "default.mysql5.6"
description = "The parameter group of RDS DB instance"
}
