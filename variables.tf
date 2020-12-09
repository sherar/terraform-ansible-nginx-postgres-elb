# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "postgres_server_ec2_instance_type" {
  description = "Postgres EC2 instance type"
}

variable "postgres_server_volume_size" {
  description = "Postgres EC2 volume size"
}

variable "web_server_ec2_instance_type" {
  description = "Web Server EC2 instance type"
}

variable "web_server_ec2_min_size" {
  description = "Web Server EC2 minimum size for autoscaling group"
}

variable "web_server_ec2_max_size" {
  description = "Web Server EC2 maximum size for autoscaling group"
}

variable "web_server_ec2_desired_capacity" {
  description = "Web Server EC2 desired capacity for autoscaling group"
}

variable "vpc_cidr" {
  description = "VPC CIDR range. It shouldnt overlap with other environments CIDR"
}

variable "vpc_private_subnets" {
  description = "Private Subnet ids. Used only for Web Servers"
}

variable "vpc_public_subnets" {
  description = "Public Subnet ids. Used only for Application Load Balancer"
}

variable "vpc_database_subnets" {
  description = "Database Subnet ids. Used only for Postgres server"
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "aws_region" {
  description = "AWS region where deploys will happen"
  default     = "eu-west-1"
}

variable "environment" {
  description = "Environment name. Usually dev or prod"
  default     = "dev"
}