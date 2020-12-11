provider "aws" {
  region = var.vpc-region
}

# Creating VPC
resource "aws_vpc" "mod-vpc" {
  cidr_block              = var.vpc-cidr-block
  enable_dns_hostnames    = true
  enable_dns_support      = true
  instance_tenancy        = "default"
  enable_classiclink      = "false"
  tags                    = {
    Name                  = "mod-vpc"
    "Billing Department"  = "IT"
    Environment           = "UAT"
  }
}

# Creating Public subnets
resource "aws_subnet" "mod-pub-subnet-1a" {
  cidr_block              = var.pub-subnet-1a-cidr
  vpc_id                  = aws_vpc.mod-vpc.id
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.vpc-region}a"
  tags                    = {
    Name = "pub-subnet-1a"
  }
}

resource "aws_subnet" "mod-pub-subnet-1b" {
  cidr_block              = var.pub-subnet-1b-cidr
  vpc_id                  = aws_vpc.mod-vpc.id
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.vpc-region}b"
  tags                    = {
    Name = "pub-subnet-1b"
  }
}

resource "aws_subnet" "mod-pub-subnet-1c" {
  cidr_block              = var.pub-subnet-1c-cidr
  vpc_id                  = aws_vpc.mod-vpc.id
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.vpc-region}c"
  tags                    = {
    Name = "pub-subnet-1c"
  }
}

# Creating Private subnets

resource "aws_subnet" "mod-pri-subnet-1a" {
  cidr_block              = var.pri-subnet-1a-cidr
  vpc_id                  = aws_vpc.mod-vpc.id
  availability_zone       = "${var.vpc-region}a"
  tags                    = {
    Name = "pri-subnet-1a"
  }
}

resource "aws_subnet" "mod-pri-subnet-1b" {
  cidr_block              = var.pri-subnet-1b-cidr
  vpc_id                  = aws_vpc.mod-vpc.id
  availability_zone       = "${var.vpc-region}b"
  tags                    = {
    Name = "pri-subnet-1b"
  }
}

resource "aws_subnet" "mod-pri-subnet-1c" {
  cidr_block              = var.pri-subnet-1c-cidr
  vpc_id                  = aws_vpc.mod-vpc.id
  availability_zone       = "${var.vpc-region}c"
  tags                    = {
    Name = "pri-subnet-1c"
  }
}

# Creating Root Table
# Creating Public Root Table
resource "aws_route_table" "mod-IGW" {
  vpc_id = aws_vpc.mod-vpc.id
  tags                    = {
    Name = "mod-IGW-RT"
  }
}

# Creating Private Root Table
resource "aws_route_table" "mod-NAT" {
  vpc_id = aws_vpc.mod-vpc.id
  tags                    = {
    Name = "mod-NAT-RT"
  }
}

# Adding Route Table Association
# Adding Public Route Table Association
resource "aws_route_table_association" "pub-subnet-1a" {
  route_table_id = aws_route_table.mod-IGW.id
  subnet_id      = aws_subnet.mod-pub-subnet-1a.id
}

resource "aws_route_table_association" "pub-subnet-1b" {
  route_table_id = aws_route_table.mod-IGW.id
  subnet_id      = aws_subnet.mod-pub-subnet-1b.id
}

resource "aws_route_table_association" "pub-subnet-1c" {
  route_table_id = aws_route_table.mod-IGW.id
  subnet_id      = aws_subnet.mod-pub-subnet-1c.id
}

# Adding Private Route Table Association
resource "aws_route_table_association" "pri-subnet-1a" {
  route_table_id = aws_route_table.mod-NAT.id
  subnet_id      = aws_subnet.mod-pri-subnet-1a.id
}

resource "aws_route_table_association" "pri-subnet-1b" {
  route_table_id = aws_route_table.mod-NAT.id
  subnet_id      = aws_subnet.mod-pri-subnet-1b.id
}

resource "aws_route_table_association" "pri-subnet-1c" {
  route_table_id = aws_route_table.mod-NAT.id
  subnet_id      = aws_subnet.mod-pri-subnet-1c.id
}

# Creating IGW
resource "aws_internet_gateway" "mod-IGW" {
  vpc_id  = aws_vpc.mod-vpc.id
  tags    = {
    Name = "mod-IGW"
  }
}

# Adding route of IGW in pub route table
resource "aws_route" "igw-route" {
  route_table_id          = aws_route_table.mod-IGW.id
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = aws_internet_gateway.mod-IGW.id
}
