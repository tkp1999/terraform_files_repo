resource "aws_vpc" "ntier-vpc" {
  cidr_block = var.vpc_network_cidr
  tags = {
    Name = local.name
  }
}
resource "aws_subnet" "web1-subnet" {
  vpc_id     = aws_vpc.ntier-vpc.id
  cidr_block = var.web1-subnet-cidr
  tags = {
    Name = "web1"
  }
  depends_on = [
    aws_vpc.ntier-vpc
  ]
}