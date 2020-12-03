/*
provider "aws" {
    region = var.region
}
Adding a Key pair via openSSH way
resource "aws_key_pair" "mykey" {
    key_name   = var.ssh-private-key-file
    public_key = var.ssh-public-key-file
}
*/

# Generated a keypair via AWS Console and reference to it here


# Getting VPC ID for instance

data "aws_subnet_ids" "pub-subnet-1a" {
    filter {
        name   = "tag:Name"
        values = ["pub-subnet-1a"] # insert values here
    }
    vpc_id = data.aws_vpc.my-vpc.id

}

data "aws_vpc" "my-vpc" {
    filter {
        name   = "tag:Name"
        values = ["mod-vpc"] # insert values here
    }
}

# Provisioning an EC2 instance
resource aws_instance "mod-ec2" {
    count               = "1"
    ami                 = var.my-ami
    instance_type       = var.my-instancetype
    get_password_data   = "true"
    key_name            = var.mod-ec2-keypair
    subnet_id           = tolist(data.aws_subnet_ids.pub-subnet-1a.ids)[count.index]
    user_data           = data.template_file.userdata_win.rendered
    tags                = {
        Name            = "fj-vm01"
        Department      = "IT"
        Environment     = "UAT"
    }
}

# User data template for creating local admin and settings its password
data "template_file" "userdata_win" {
    template = <<EOF
        <script>
        echo "" > _INIT_STARTED_
        net user ${var.INSTANCE_USERNAME} /add /y
        net user ${var.INSTANCE_USERNAME} ${var.INSTANCE_PASSWORD}
        net localgroup administrators ${var.INSTANCE_USERNAME} /add
        </script>
        <persist>false</persist>
        EOF

}
