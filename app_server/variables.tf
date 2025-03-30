variable "app_instance_count" {
  type = number 
}
variable "app_ami" {
  type = string 
}
variable "app_instance_type" {
  type = string 
}
variable "private_subnet_ids" {
  type = list(string) 
}
variable "app_sg_id" {
  type = string 
}
variable "name_prefix" {
  type = string 
}
variable "tags" { 
  type = map(string)
  default = {} 
}
