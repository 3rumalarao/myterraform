variable "creation_token" {
  type = string 
}
variable "private_subnet_ids" {
  type = list(string) 
}
variable "efs_sg_id" {
  type = string 
}
variable "name_prefix" {
  type = string 
}
variable "tags" {
  type = map(string) 
  default = {} 
}
