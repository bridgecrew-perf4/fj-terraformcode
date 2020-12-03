output "ec2-data" {
  value = aws_instance.mod-ec2.get_password_data
}

output "ec2-getip" {
  value = aws_instance.mod-ec2.private_ip
}