# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "alb_target_group_arn" {
  description = "AWS ALB target group"
}

variable "alb_security_group_id" {
  description = "AWS ALB security group id used to limit instance access"
}

variable "desired_capacity" {
  description = "Desired amount of EC2 instances"
  default = 3
}

variable "environment" {
  description = "Test or Production environment reference"    
}

variable "instance_type" {
  description = "AWS EC2 instance type for Web Server"
}

variable "key_name" {
  description = "EC2 Key Pair name"
}

variable "max_size" {
  description = "Maximum amount of EC2 instances"
}

variable "min_size" {
  description = "Minium amount of EC2 instances"
}

variable "subnet_ids" {
  description = "List of subnet ids to place the ELB into."
  type        = list(string)
}

variable "vpc_id" {
  description = "AWS VPC id"
}