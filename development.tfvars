## AWS
aws_region  = "eu-west-1"
environment = "dev"

## Web Server
web_server_ec2_instance_type    = "t2.micro"
web_server_ec2_min_size         = 3
web_server_ec2_max_size         = 3
web_server_ec2_desired_capacity = 3

## Postgres Server
postgres_server_ec2_instance_type = "t2.micro"
postgres_server_volume_size       = 50

## VPC
vpc_cidr             = "20.10.0.0/16"
vpc_private_subnets  = ["20.10.1.0/24", "20.10.2.0/24", "20.10.3.0/24"]
vpc_public_subnets   = ["20.10.11.0/24", "20.10.12.0/24", "20.10.13.0/24"]
vpc_database_subnets = ["20.10.21.0/24", "20.10.22.0/24", "20.10.23.0/24"]