# Provisioning an EC2 instance

resource aws_instance "mod-ec2" {
    ami                 = var.my-ami

    instance_type       = var.my-instancetype
    get_password_data   = "true"
    key_name            = var.mod-ec2-keypair
    subnet_id           = var.subnet-id                     # value will be passed from main.tf via referencing mod-vpc.
                                                            #I had to output IDs from vpc module (output.tf)
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
