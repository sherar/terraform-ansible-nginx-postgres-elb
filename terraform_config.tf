## Option 1: Single account configuration

provider "aws" {
  region  = var.aws_region
  version = "~> 3.18.0"
}

## Option 2: Cross account environment configuration

# # Terraform state remote storage
# terraform {
#   backend "s3" {
#     bucket  = "your-s3-bucket"
#     key     = "states/terraform.tfstate"
#     region  = "eu-west-1"
#     profile = "your-aws-profile-account-name"
#   }
# }

# # Cross account environment configuration
# variable "workspace_iam_roles" {
#   default = {
#     development = "arn:aws:iam::111111111111:role/development-role"
#     production  = "arn:aws:iam::222222222222:role/production-role"
#   }
# }

# AWS provider
# provider "aws" {
#   region  = var.aws_region
#   version = "~> 3.18.0"
#   assume_role {
#     role_arn     = var.workspace_iam_roles[terraform.workspace]
#     session_name = "TerraformSession"
#   }
# }

