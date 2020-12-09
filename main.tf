# -------------------------------------------------------------------------------------------------
# VPC
# -------------------------------------------------------------------------------------------------

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.64.0"

  name = "${var.environment}-terraform-vpc"
  cidr = var.vpc_cidr

  azs              = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  private_subnets  = var.vpc_private_subnets
  public_subnets   = var.vpc_public_subnets
  database_subnets = var.vpc_database_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  tags = {
    Application = "VPC"
    Environment = var.environment
  }
}

# -------------------------------------------------------------------------------------------------
# Key Pair
# -------------------------------------------------------------------------------------------------

module "ec2_key_pair" {
  source   = "./modules/key_pair"
  key_name = "${var.environment}-terraform-key"
}

# -------------------------------------------------------------------------------------------------
# Elastic Load Balancer
# -------------------------------------------------------------------------------------------------

module "lb" {
  source      = "./modules/lb"
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.public_subnets
  environment = var.environment
}

# -------------------------------------------------------------------------------------------------
# Web Server
# -------------------------------------------------------------------------------------------------

module "web_server" {
  source                = "./modules/web_server"
  key_name              = module.ec2_key_pair.key_pair_name
  instance_type         = var.web_server_ec2_instance_type
  alb_target_group_arn  = module.lb.target_group_arn
  alb_security_group_id = module.lb.security_group_id
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.private_subnets
  desired_capacity      = var.web_server_ec2_desired_capacity
  min_size              = var.web_server_ec2_min_size
  max_size              = var.web_server_ec2_max_size
  environment           = var.environment
}

# -------------------------------------------------------------------------------------------------
# Postgres Server
# -------------------------------------------------------------------------------------------------

module "postgres_server" {
  source                 = "./modules/postgres_server"
  allowed_security_group = module.web_server.security_group_id
  environment            = var.environment
  instance_type          = var.postgres_server_ec2_instance_type
  key_name               = module.ec2_key_pair.key_pair_name
  subnet_ids             = module.vpc.database_subnets
  volume_size            = var.postgres_server_volume_size
  vpc_id                 = module.vpc.vpc_id
}