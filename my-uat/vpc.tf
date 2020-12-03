/*
# Creating VPC
resource "aws_vpc" "fj-vpc" {
  cidr_block            = var.my-vpccidr
  enable_dns_hostnames  = "true"
  enable_dns_support    = "true"
  instance_tenancy      = "default"
  enable_classiclink    = "false"
  tags = {
    Name = "fj-VPC"
  }
}

# Creating subnets
resource "aws_subnet" "fj-public" {
  cidr_block              = var.my-pubsubnet-cidr
  vpc_id                  = aws_vpc.fj-vpc.id
  map_public_ip_on_launch = "true"
  availability_zone       = var.my-az.0
  tags = {
    Name = "fj-Pubsubnet"
  }
}
*/


