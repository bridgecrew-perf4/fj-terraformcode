# Root level
region             = "eu-north-1"

# Module_VPC level
vpc-region         = "eu-north-1"
vpc-cidr-block     = "10.222.0.0/16"
pub-subnet-1a-cidr = "10.222.1.0/24"
pub-subnet-1b-cidr = "10.222.2.0/24"
pub-subnet-1c-cidr = "10.222.3.0/24"
pri-subnet-1a-cidr = "10.222.101.0/24"
pri-subnet-1b-cidr = "10.222.102.0/24"
pri-subnet-1c-cidr = "10.222.103.0/24"

# Module_ec2 level
my-ami             = "ami-0d365da7a0e121309"
my-instancetype    = "t3.micro"
INSTANCE_PASSWORD  = "Passw0rd012345"
mod-ec2-keypair    = "modEc2Key-101"