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
 # count      = var.subnet_count
  vpc_id     = aws_vpc.ntier-vpc.id
  cidr_block = var.subnet_cidr_ranges[count.index]
  tags = {
    Name = var.subnet_names[count.index]
  }
  depends_on = [aws_vpc.ntier-vpc]
  */
}
data "aws_route_table" "default" {
  vpc_id = aws_vpc.ntier-vpc.id
  depends_on = [
    aws_vpc.ntier-vpc
  ]
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ntier-vpc.id
  tags = {
    Name = "ntier igw"
  }
  depends_on = [aws_vpc.ntier-vpc]
}
resource "aws_route" "igw_route" {
  route_table_id         = data.aws_route_table.default.id
  destination_cidr_block = local.anywhere
  gateway_id             = aws_internet_gateway.igw.id
  depends_on = [
    aws_internet_gateway.igw,
    aws_vpc.ntier-vpc
  ]
}

