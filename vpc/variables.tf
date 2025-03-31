variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "enable_flow_logs" {
  type = bool
}

variable "dhcp_options" {
  type = object({
    domain_name         = string,
    domain_name_servers = list(string)
  })
}

variable "common_tags" {
  type = map(string)
}
