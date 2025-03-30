variable "environment" {
  description = "Deployment environment, e.g., dev or prod"
  type        = string
  default     = "dev"
}

variable "name_prefix" {
  type = string 
}
variable "mysql_engine_version" {
  type = string 
}
variable "mysql_instance_class" {
  type = string 
}
variable "mysql_allocated_storage" {
  type = number 
}
variable "mysql_storage_type" {
  type = string 
}
variable "mysql_username" {
  type = string 
}
variable "mysql_password" {
  type = string 
  sensitive = true 
}
variable "private_subnet_ids" {
  type = list(string) 
}
variable "db_sg_id" {
  type = string 
}
variable "tags" {
  type = map(string)
  default = {} 
}
