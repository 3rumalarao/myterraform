variable "public_instance_count" {
  type = number 
}
variable "public_ami" {
  type = string 
}
variable "public_instance_type" {
  type = string 
}
variable "public_subnet_ids" {
  type = list(string) 
}
variable "public_sg_id" {
  type = string 
}
variable "name_prefix" {
  type = string 
}
variable "tags" {
  type = map(string) 
  default = {} 
}
