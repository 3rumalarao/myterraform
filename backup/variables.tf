variable "name_prefix" {
  type = string 
}
variable "backup_schedule" {
  type = string 
  default = "cron(0 5 * * ? *)" 
}
variable "backup_retention_days" {
  type = number 
  default = 7 
}
variable "backup_role_arn" {
  type = string 
}
variable "tags" {
  type = map(string) 
  default = {} 
}
