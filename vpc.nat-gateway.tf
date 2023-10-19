
resource "aws_nat_gateway" "nat_gateway_1a" {
  allocation_id = aws_eip.elastic_ip_1a.id
  subnet_id     = aws_subnet.public_subnets[0].id
  tags          = merge({ Name = "youtube-main-vpc-nat-gateway-1a" }, var.tags)
}