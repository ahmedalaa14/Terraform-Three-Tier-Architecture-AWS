output "db_name" {
  value = aws_db_instance.my_rds.name
}

output "db_endpoint" {
  value = aws_db_instance.my_rds.endpoint
}

