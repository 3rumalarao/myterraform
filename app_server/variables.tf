variable "app_instance_count" {
  description = "Number of application instances"
  type        = number
  default     = 2
}

variable "app_ami_list" {
  description = "List of AMI IDs for application servers"
  type        = list(string)
}

variable "app_instance_types" {
  description = "List of instance types for application servers"
  type        = list(string)
}

variable "app_instance_names" {
  description = "List of instance names for application servers"
  type        = list(string)
}

variable "app_sg_ids" {
  description = "List (of lists) of security group IDs for each app instance"
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
