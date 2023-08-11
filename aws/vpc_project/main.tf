resource "aws_vpc" "ntier-vpc" {
  cidr_block = var.vpc_network_cidr
  tags = {
    Name = local.name
  }
}

resource "aws_subnet" "subnets" {
  count  = length(var.subnet_names)
  vpc_id = aws_vpc.ntier-vpc.id
  tags = {
    Name = var.subnet_names[count.index]
  }
  //cidr_block = format(var.subnet_format, count.index)
  cidr_block = cidrsubnet(var.vpc_network_cidr, 8, count.index)
  depends_on = [aws_vpc.ntier-vpc]
  /*
  count      = var.subnet_count
  vpc_id     = aws_vpc.ntier-vpc.id
  cidr_block = var.subnet_cidr_ranges[count.index]
  tags = {
    Name = var.subnet_names[count.index]
  }
  depends_on = [aws_vpc.ntier-vpc]
  */
}

