variable "vpc_cidr" {
  type = string 
}
variable "vpc_name" {
  type = string 
}
variable "public_subnets" {
  type = list(string) 
}
variable "private_subnets" {
  type = list(string) 
}
variable "public_azs" {
  type = list(string) 
}
variable "private_azs" {
  type = list(string) 
}
variable "enable_nat_gateway" {
  type = bool 
  default = true 
}
variable "tags" {
  type = map(string) 
  default = {} 
}
