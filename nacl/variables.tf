variable "vpc_id" {
  type = string 
}

variable "allowed_cidr" {
  type = string
  default = "10.0.0.0/16" 
}
variable "tags" {
  type = map(string)
  default = {} 
}
