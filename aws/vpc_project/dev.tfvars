vpc_network_cidr = "10.10.0.0/16"
subnet_names     = ["web1", "web2", "app1", "app2", "db1", "db2"]
websg_config = {
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
    }
  ]
}
dbsg_config = {
  name        = "dbsg"
  description = "This is db web security group"
  rules = [{
    type       = "ingress"
    from_port  = 3306
    to_port    = 3306
    protocol   = "tcp"
    cidr_block = "10.10.0.0/16"

    },
    {
      type       = "egress"
      from_port  = 0
      to_port    = 65535
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    }
  ]
}
appsg_config = {
  name        = "appsg"
  description = "This is web security group config"
  rules = [{
    type       = "ingress"
    from_port  = 8080
    to_port    = 8080
    protocol   = "tcp"
    cidr_block = "10.10.0.0/16"

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
    }
  ]
}