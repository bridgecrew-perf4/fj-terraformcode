output "ec2-data" {
  value = aws_instance.mod-ec2
}

output "ec2-getip" {
  value = aws_instance.mod-ec2.private_ip
}