module "network" {
  source               = "./network"
  vpc_name             = var.vpc_name
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  public_subnet_tags   = var.public_subnet_tags
  private_subnet_tags  = var.private_subnet_tags
  vpc_ip               = var.vpc_ip
}

module "asg" {
  source = "./ASG"

  AZ                 = var.AZ
  ami                = var.ami
  private_ec2_tags   = var.private_ec2_tags
  vpc_id             = module.network.vpc_id
  public_subnets_id  = module.network.public_subnets_id
  public_SG_EC2s     = module.network.public_SG_EC2s
  private_subnets_id = module.network.private_subnets_id
  elb_id             = module.network.elb_id
  lb_name            = var.lb_name
  lb_type            = var.lb_type
  private_SG_EC2s    = module.network.private_SG_EC2s
  public_ec2_tags    = var.public_ec2_tags
}


module "ALB" {
  source             = "./ALB"
  lb_name            = var.lb_name
  lb_type            = var.lb_type
  ALB_SG             = module.network.LB_SG
  public_subnets_id  = module.network.public_subnet_id
  ami                = var.ami
  vpc_id             = module.network.vpc_id
  AZ                 = var.AZ
  private_subnets_id = module.network.private_subnet_id
}


module "RDS" {
  source     = "./RDS"
  sg_id      = module.network_module.DB_SG
  rds_info   = var.rds_info
  subnet_ids = module.network_module.private_subnet_id
}   