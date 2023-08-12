resource "aws_security_group" "websg" {
  name        = var.websg_config.name
  description = var.websg_config.description
  vpc_id      = aws_vpc.ntier-vpc.id
  depends_on = [
    aws_vpc.ntier-vpc
  ]
}
resource "aws_security_group_rule" "websg_rules" {
  count             = length(var.websg_config.rules)
  security_group_id = aws_security_group.websg.id
  type              = var.websg_config.rules[count.index].type
  from_port         = var.websg_config.rules[count.index].from_port
  to_port           = var.websg_config.rules[count.index].to_port
  protocol          = var.websg_config.rules[count.index].protocol
  cidr_blocks       = [var.websg_config.rules[count.index].cidr_block]
  depends_on = [
    aws_security_group.websg
  ]
}


resource "aws_security_group" "appsg" {
  name        = var.appsg_config.name
  description = var.appsg_config.description
  vpc_id      = aws_vpc.ntier-vpc.id
  depends_on = [
    aws_vpc.ntier-vpc
  ]
}
resource "aws_security_group_rule" "appsg_rules" {
  count             = length(var.appsg_config.rules)
  security_group_id = aws_security_group.appsg.id
  type              = var.appsg_config.rules[count.index].type
  from_port         = var.appsg_config.rules[count.index].from_port
  to_port           = var.appsg_config.rules[count.index].to_port
  protocol          = var.appsg_config.rules[count.index].protocol
  cidr_blocks       = [var.appsg_config.rules[count.index].cidr_block]
  depends_on = [
    aws_security_group.appsg
  ]
}

resource "aws_security_group" "dbsg" {
  name        = var.dbsg_config.name
  description = var.dbsg_config.description
  vpc_id      = aws_vpc.ntier-vpc.id
  depends_on = [
    aws_vpc.ntier-vpc
  ]
}
resource "aws_security_group_rule" "dbsg_rules" {
  count             = length(var.dbsg_config.rules)
  security_group_id = aws_security_group.dbsg.id
  type              = var.dbsg_config.rules[count.index].type
  from_port         = var.dbsg_config.rules[count.index].from_port
  to_port           = var.dbsg_config.rules[count.index].to_port
  protocol          = var.dbsg_config.rules[count.index].protocol
  cidr_blocks       = [var.dbsg_config.rules[count.index].cidr_block]
  depends_on = [
    aws_security_group.dbsg
  ]
}

/*
resource "aws_security_group_rule" "websg_http" {
  security_group_id = aws_security_group.websg.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  depends_on        = [aws_security_group.websg]
}
resource "aws_security_group_rule" "websg_ssh" {
  security_group_id = aws_security_group.websg.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  depends_on        = [aws_security_group.websg]
}
resource "aws_security_group_rule" "websg_out" {
  security_group_id = aws_security_group.websg.id
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  depends_on        = [aws_security_group.websg]

}
*/