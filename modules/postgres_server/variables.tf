# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "allowed_security_group" {
  description = "Security group wich can access Postgres server"
}

variable "environment" {
  description = "Test or Production environment reference"    
}

variable "instance_type" {
  description = "Postgres EC2 instance type"
}

variable "key_name" {
  description = "EC2 Key Pair name"
}

variable "subnet_ids" {
  description = "List of subnet ids to place the ELB into."
  type        = list(string)
}

variable "volume_size" {
  description = "Postgres EC2 volume size"
}

variable "vpc_id" {
  description = "AWS VPC id"
}
