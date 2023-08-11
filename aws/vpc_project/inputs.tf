variable "vpc_network_cidr" {
  type        = string
  default     = "10.10.0.0/16"
  description = "This is network cidr"
}

/*
variable "subnet_cidr_ranges" {
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24"]
  description = "this is subnet cidr ranges"
}
*/
variable "subnet_format" {
  type = string
  default = "10.10.%g.0/24"
  description = "This variable i have used to define subnet format"
  
}
variable "subnet_names" {
  type        = list(string)
  default     = ["web1", "web2", "app1", "app2", "db1", "db2"]
  description = "These are subnet names"

}
/*
variable "subnet_count" {
  type    = number
  default = 6

}
*/

