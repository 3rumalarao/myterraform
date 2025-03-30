output "mysql_instance_id" {
  value = aws_instance.mysql.id
}

output "postgresql_instance_id" {
  value = aws_instance.postgresql.id
}
