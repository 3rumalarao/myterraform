variable "web_instance_count" {
  type = number 
}
variable "web_ami" {
  type = string 
}
variable "web_instance_type" {
  type = string 
}
variable "private_subnet_ids" {
  type = list(string) 
}
variable "web_sg_id" {
  type = string 
}
variable "name_prefix" {
  type = string 
}
variable "tags" {
  type = map(string)
  default = {} 
}
