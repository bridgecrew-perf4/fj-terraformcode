output "vpc-id" {
  value = aws_vpc.mod-vpc.id
}

output "vpc-cidr-block" {
  value = aws_vpc.mod-vpc.cidr_block
}

# With the help of these outputs, we can assign value to subnet-id to provision ec2
output "pub-subnet-1a-id" {
  value = aws_subnet.mod-pub-subnet-1a.id
}
output "pub-subnet-1b-id" {
  value = aws_subnet.mod-pub-subnet-1b.id
}

output "pub-subnet-1c-id" {
  value = aws_subnet.mod-pub-subnet-1c.id
}