variable "name_prefix" {
  type = string 
}
variable "public_subnet_ids" {
  type = list(string) 
}
variable "vpc_id" {
  type = string 
}
variable "alb_sg_id" {
  type = string 
}
variable "alb_target_port" {
  type = number 
}
variable "alb_target_protocol" {
  type = string 
}
variable "alb_listener_port" {
  type = number 
}
variable "alb_listener_protocol" {
  type = string 
}
variable "alb_health_check_path" {
 type = string 
}
variable "tags" {
  type = map(string)
  default = {} 
}
