module "vpc" {
  source         = "./modules/vpc"
  region         = var.region
  cidr_block     = var.cidr_block
  private_subnet = var.private_subnet
  public_subnet  = var.public_subnet
  azs            = var.azs
}

module "ec2" {
  source                 = "./modules/ec2"
  instance               = var.instance
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.vpc.sg_group_id]
}