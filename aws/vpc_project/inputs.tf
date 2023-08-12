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

/*
variable "subnet_format" {
  type        = string
  default     = "10.10.%g.0/24"
  description = "This variable i have used to define subnet format"

}
*/
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
variable "websg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = string
      to_port    = string
      protocol   = string
      cidr_block = string

    }))
  })
  description = "This is web security group"
  default = {
    name        = "websg"
    description = "This is web security group"
    rules = [{
      type       = "ingress"
      from_port  = 80
      to_port    = 80
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
      },
      {
        type       = "ingress"
        from_port  = 22
        to_port    = 22
        protocol   = "tcp"
        cidr_block = "0.0.0.0/0"
      },
      {
        type       = "egress"
        from_port  = 0
        to_port    = 65535
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
    }]
  }

}

variable "appsg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = string
      to_port    = string
      protocol   = string
      cidr_block = string

    }))
  })
  description = "This is app security group config"
}
variable "dbsg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = string
      to_port    = string
      protocol   = string
      cidr_block = string

    }))
  })
  description = "This is db security group config"
}
