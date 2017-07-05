resource "aws_db_instance" "terraform_rds" {
  allocated_storage    = "${var.rds_allocated_storage}"
  storage_type         = "${var.rds_storage_type}"
  engine               = "${var.rds_engine}"
  engine_version       = "${var.rds_engine_version}"
  instance_class       = "${var.rds_instance_class}"
  name                 = "${var.rds_name}"
  username             = "${var.rds_username}"
  password             = "${var.rds_password}"
  db_subnet_group_name = "${var.rds_subnet_group}"
  parameter_group_name = "${var.rds_parameter_group}"
  publicly_accessible  = "true"
  vpc_security_group_ids = ["${aws_security_group.rds.id}"]
  skip_final_snapshot  = "true"
}

resource "aws_security_group" "rds" {
  name        = "terraform_rds_sg"
  description = "Security group for terraform RDS instance"

  # Mysql access from app servers
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = ["${aws_security_group.app.id}"]
  }

  }

