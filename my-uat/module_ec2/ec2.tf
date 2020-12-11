# Provisioning an EC2 instance
resource aws_instance "mod-ec2" {
    ami                 = var.my-ami
    instance_type       = var.my-instancetype
    get_password_data   = "true"
    key_name            = var.mod-ec2-keypair
    iam_instance_profile = data.aws_iam_role

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
        <powershell>
        $instanceId = (invoke-webrequest http://169.254.169.254/latest/meta-data/instance-id -UseBasicParsing).content
        $nameValue = (get-ec2tag -filter @{Name="resource-id";Value=$instanceid},@{Name="key";Value="Name"}).Value
        $pattern = "^(?![0-9]{1,15}$)[a-zA-Z0-9-]{1,15}$"
        ##Verify Name Value satisfies best practices for Windows hostnames
        If ($nameValue -match $pattern)
            {Try
                {Rename-Computer -NewName $nameValue -Restart -ErrorAction Stop}
            Catch
                {$ErrorMessage = $_.Exception.Message
                Write-Output "Rename failed: $ErrorMessage"}}
        Else
            {Throw "Provided name not a valid hostname. Please ensure Name value is between 1 and 15 characters in length and contains only alphanumeric or hyphen characters"}
        </powershell>
        #<persist>false</persist>
        EOF
}

data "aws_iam_role" "renaming-host" {
    name      = "Rename-Hostname"
    role_name = "Rename-Hostname"
}