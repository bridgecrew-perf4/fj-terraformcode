/*
provider "aws" {
  region = var.region
}
*/

module "vpc" {
  source                = "./module_vpc"
  vpc-cidr-block        = var.vpc-cidr-block
  vpc-region            = var.vpc-region
  pub-subnet-1a-cidr    = var.pub-subnet-1a-cidr
  pub-subnet-1b-cidr    = var.pub-subnet-1b-cidr
  pub-subnet-1c-cidr    = var.pub-subnet-1c-cidr
}

module "ec2" {
  source                = "./module_ec2"
  depends_on            = [module.vpc]
  region                = var.region
  my-ami                = var.my-ami
  my-instancetype       = var.my-instancetype
  INSTANCE_PASSWORD     = var.INSTANCE_PASSWORD
  mod-ec2-keypair       = var.mod-ec2-keypair
  #vpc-id                = module.vpc.vpc-cidr-block
}
