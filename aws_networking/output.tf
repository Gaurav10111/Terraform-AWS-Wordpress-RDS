output "vpc_id" {
  value = aws_vpc.tfvpc.id
}

output "private_subnet_1a_id" {
  value = aws_subnet.lw_private_subnet_1a.id
}

output "private_subnet_1b_id" {
  value = aws_subnet.lw_private_subnet_1b.id
}

output "public_subnet_1a_id" {
  value = aws_subnet.lw_public_subnet_1a.id
}