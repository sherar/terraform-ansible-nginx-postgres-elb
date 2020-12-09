## AWS
aws_region  = "eu-west-1"
environment = "prod"

## Web Server
web_server_ec2_instance_type    = "c5.large"
web_server_ec2_min_size         = 2
web_server_ec2_max_size         = 2
web_server_ec2_desired_capacity = 2

## Postgres Server
postgres_server_ec2_instance_type = "c5.large"
postgres_server_volume_size       = 500

vpc_cidr             = "10.10.0.0/16"
vpc_private_subnets  = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
vpc_public_subnets   = ["10.10.11.0/24", "10.10.12.0/24", "10.10.13.0/24"]
vpc_database_subnets = ["10.10.21.0/24", "10.10.22.0/24", "10.10.23.0/24"]