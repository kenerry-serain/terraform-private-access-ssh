resource "aws_route_table" "private_1a" {
  vpc_id = aws_vpc.youtube_main_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_1a.id
  }

  tags = merge({ Name = "youtube-main-vpc-private-route-table-1a" }, var.tags)
}

resource "aws_route_table_association" "private_1a_associations" {
  count          = length(aws_subnet.private_subnets)
  subnet_id      = [for subnet in aws_subnet.private_subnets : subnet if subnet.availability_zone == "us-east-1a"][0].id
  route_table_id = aws_route_table.private_1a.id
}
