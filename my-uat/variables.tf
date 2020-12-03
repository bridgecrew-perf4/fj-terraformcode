variable "region" {}

variable "vpc-region" {
  description = "region to deploy vpc"
}

variable "vpc-cidr-block" {
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

variable "my-ami" {
  description = "Stockholm AMIs"
}

variable "my-instancetype" {
  description = "my desired EC2 type"
}

variable "INSTANCE_PASSWORD" {
  description = "Password for Windows Instance"
}

/*
variable "ssh-public-key-file" {
  default     = ""
}

variable "ssh-private-key-file" {
  default     = ""
}
*/

variable "mod-ec2-keypair" {
  description = "Referencing the key we have generated via aws cli"
}

