# Root
variable "region" {}


# VPC
variable "vpc-region" {
  description = "region to deploy vpc"
}

variable "vpc-cidr-block" {
  description = "define CIDR block for VPC"
}
# VPC/Public subnets
variable "pub-subnet-1a-cidr" {
  description = "defining CIDR block for Public subnet 1a"
}

variable "pub-subnet-1b-cidr" {
  description = "defining CIDR block for Public subnet 1b"
}

variable "pub-subnet-1c-cidr" {
  description = "defining CIDR block for Public subnet 1c"
}

# VPC/Private subnets
variable "pri-subnet-1a-cidr" {
  description = "defining CIDR block for Private subnet 1a"
}

variable "pri-subnet-1b-cidr" {
  description = "defining CIDR block for Private subnet 1a"
}

variable "pri-subnet-1c-cidr" {
  description = "defining CIDR block for Private subnet 1a"
}


# EC2
variable "my-ami" {
  description = "Stockholm AMIs"
}

variable "my-instancetype" {
  description = "my desired EC2 type"
}

variable "INSTANCE_PASSWORD" {
  description = "Password for Windows Instance"
}

variable "mod-ec2-keypair" {
  description = "Referencing the key we have generated via aws cli"
}

