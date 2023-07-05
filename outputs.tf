#outputs.tf

output "vpc_security_group_id" {
  value = aws_security_group.rds_mySQL_sg.id
}

output "aws_db_instance_" {
  value = aws_db_instance.mySQL_instance.endpoint
}