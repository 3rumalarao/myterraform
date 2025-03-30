output "db_subnet_group_name" {
  value = aws_db_subnet_group.this.name
}
output "rds_mysql_endpoint" {
  value = length(aws_db_instance.mysql) > 0 ? aws_db_instance.mysql[0].endpoint : ""
}
