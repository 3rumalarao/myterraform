variable "mysql_ami" {
  type = string 
}
variable "mysql_instance_type" {
  type = string 
}
variable "postgres_ami" {
  type = string 
}
variable "postgres_instance_type" {
  type = string 
}
variable "private_subnet_ids" {
  type = list(string) 
}
variable "db_sg_id" {
  type = string 
}
variable "name_prefix" {
  type = string 
}
variable "tags" {
  type = map(string) 
  default = {} 
}
