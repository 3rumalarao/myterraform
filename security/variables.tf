variable "vpc_id" { 
  type = string 
}

variable "name_prefix" {
  type = string 
}
variable "web_ingress_rules" {
  type = list(object({
  description = string
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = list(string)
  }))
  default = [] 
}

variable "app_ingress_rules" { 
  type = list(object({
  description = string
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = list(string)
  })) 
  default = [] 
}

variable "db_ingress_rules" { 
  type = list(object({
  description = string
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = list(string)
  })) 
  default = [] 
}


variable "efs_ingress_rules" { 
  type = list(object({
  description = string
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = list(string)
  })) 
  default = [] 
}

variable "tags" { 
  type = map(string) 
  default = {} 
}
