# infrastructure-learnings
This repository contains the templates, configuration files etc for managing the infrastructure.

The terraform folder contains the configurations to launch an architectuire using terraform. The architecture consists of an autoscaling group, a load balancer, a RDS instance and two EC2 instances. The custom VPC is created along with public and private subnets. The route table, NACL and security group rules are defined. Note: The configurations are divided into resources files for example, different config files for launching rds and autoscaling group etc. and different variable files eg lc-variables.tf and asg-variables.tf contains the list of all the variables initialized.


