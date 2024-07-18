output "security_group_ids" {
    value = [
        aws_default_security_group.edwin_public_sg.id
    ]
  
}
output "public_subnet_1" {
    value = aws_subnet.public_subnet_1.id
  
}

output "public_subnet_group" {
    value = [
        aws_subnet.public_subnet_1.id,
        aws_subnet.public_subnet_2.id
    ]
}