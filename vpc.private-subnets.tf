resource "aws_subnet" "private_subnets" {
  count             = (length(var.private_subnets))
  vpc_id            = aws_vpc.youtube_main_vpc.id
  cidr_block        = var.private_subnets[count.index].cidr_block
  availability_zone = var.private_subnets[count.index].availability_zone
  tags                    = merge({ Name = var.private_subnets[count.index].availability_zone }, var.tags)
}
