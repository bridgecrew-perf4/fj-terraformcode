variable "vpc-region" {
  #default = "eu-north-1"
  description = "region to deploy vpc"
}

variable "vpc-cidr-block" {
  #default = "10.222.0.0/16"
  description = "define CIDR block for VPC"
}

variable "pub-subnet-1a-cidr" {
  description = "defining CIDR block for Public subnet 1a"
}

variable "pub-subnet-1b-cidr" {
  description = "defining CIDR block for Public subnet 1b"
}

variable "pub-subnet-1c-cidr" {
  description = "defining CIDR block for Public subnet 1c"
}

variable "pri-subnet-1a-cidr" {
  description = "defining CIDR block for Private subnet 1a"
}

variable "pri-subnet-1b-cidr" {
  description = "defining CIDR block for Private subnet 1a"
}

variable "pri-subnet-1c-cidr" {
  description = "defining CIDR block for Private subnet 1a"
}