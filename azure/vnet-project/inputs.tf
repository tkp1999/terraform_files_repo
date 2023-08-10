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
  type        = list(string)
  default     = ["10.10.0.0/16"]
  description = "This is default network range"

}