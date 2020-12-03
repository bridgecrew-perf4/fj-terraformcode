variable "region" {}

variable "my-ami" {
    description = "Stockholm AMIs"
}

variable "my-instancetype" {
    description = "my desired EC2 type"
}

variable "INSTANCE_PASSWORD" {
    description = "Password for Windows Instance"
}

variable "INSTANCE_USERNAME" {
    default = "compute.admin"
    description = "Local admin"
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

#variable "vpc-id" {}

variable "subnet-id" {
    default = ""
}
