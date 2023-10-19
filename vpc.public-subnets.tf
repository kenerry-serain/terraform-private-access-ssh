resource "aws_subnet" "public_subnets" {
  count                   = (length(var.public_subnets))
  vpc_id                  = aws_vpc.youtube_main_vpc.id
  cidr_block              = var.public_subnets[count.index].cidr_block
  map_public_ip_on_launch = var.public_subnets[count.index].map_public_ip_on_launch
  availability_zone       = var.public_subnets[count.index].availability_zone
  tags                    = merge({ Name = var.public_subnets[count.index].availability_zone }, var.tags)
}
