variable "resource_group_name" {
  type        = string
  default     = "ntierazure"
  description = "This is resource group name"
}
variable "location" {
  type        = string
  default     = "eastus"
  description = "This is default location in azure that i have mentioned for my projects"
}
variable "network_range" {
  type        = string
  default     = "10.10.0.0/16"
  description = "This is default network range"

}
/*
variable "subnet_ranges" {
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
  description = "These are subnet ranges"
}
*/
variable "subnet_names" {
  type        = list(string)
  default     = ["app", "web", "db"]
  description = "These are subnet names"

}