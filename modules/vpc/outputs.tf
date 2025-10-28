output "public_subnets" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnets" {
  value = aws_subnet.private_subnets[*].id
}

output "sg_group_id" {
  value = aws_security_group.main_sg_group.id
}

output "my_vpc" {
  value = aws_vpc.main_vpc.id
}