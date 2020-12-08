module "vpc" {
  source                = "./module_vpc"
  vpc-cidr-block        = var.vpc-cidr-block
  vpc-region            = var.vpc-region
  pub-subnet-1a-cidr    = var.pub-subnet-1a-cidr
  pub-subnet-1b-cidr    = var.pub-subnet-1b-cidr
  pub-subnet-1c-cidr    = var.pub-subnet-1c-cidr
  pri-subnet-1a-cidr    = var.pri-subnet-1a-cidr
  pri-subnet-1b-cidr    = var.pri-subnet-1b-cidr
  pri-subnet-1c-cidr    = var.pri-subnet-1c-cidr
}

module "ec2" {
  source                = "./module_ec2"
  depends_on            = [module.vpc]
  region                = var.region
  my-ami                = var.my-ami
  my-instancetype       = var.my-instancetype
  INSTANCE_PASSWORD     = var.INSTANCE_PASSWORD
  mod-ec2-keypair       = var.mod-ec2-keypair
  subnet-id             = module.vpc.pub-subnet-1a-id       # This value is obtained from module_vpc/output.tf
}
