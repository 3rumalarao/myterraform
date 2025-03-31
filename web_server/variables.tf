variable "web_instance_count" {
  description = "Number of web server instances"
  type        = number
  default     = 1
}

variable "web_ami_list" {
  description = "List of AMI IDs for web servers"
  type        = list(string)
}

variable "web_instance_types" {
  description = "List of instance types for web servers"
  type        = list(string)
}

variable "web_instance_names" {
  description = "List of instance names for web servers"
  type        = list(string)
}

variable "web_sg_ids" {
  description = "List (of lists) of security group IDs for each web instance"
  type        = list(list(string))
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "tags" {
  description = "Tags to assign to resources"
  type        = map(string)
  default     = {}
}
