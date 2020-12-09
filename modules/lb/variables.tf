# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "environment" {
  description = "Test or Production environment reference"    
}

variable "subnet_ids" {
  description = "List of subnet ids to place the ELB into."
  type        = list(string)
}

variable "vpc_id" {
  description = "AWS VPC id"
}
