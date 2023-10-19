resource "aws_route_table" "public" {
  vpc_id = aws_vpc.youtube_main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.youtube_internet_gateway.id
  }

  tags = merge({ Name = "youtube-main-vpc-public-route-table" }, var.tags)
}

resource "aws_route_table_association" "public_associations" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public.id
}


