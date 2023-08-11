resource "aws_vpc" "ntier-vpc" {
  cidr_block = var.vpc_network_cidr
  tags = {
    Name = local.name
  }
}