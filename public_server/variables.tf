variable "public_instance_count" {
  description = "Number of public server instances"
  type        = number
  default     = 2
}

variable "public_ami_list" {
  description = "List of AMI IDs for public servers"
  type        = list(string)
}

variable "public_instance_types" {
  description = "List of instance types for public servers"
  type        = list(string)
}

variable "public_instance_names" {
  description = "List of instance names for public servers"
  type        = list(string)
}

variable "public_sg_ids" {
  description = "List (of lists) of security group IDs for each public instance"
  type        = list(list(string))
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
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
