resource "aws_network_interface" "interface" {
  subnet_id =  aws_subnet.public_subnets[0].id
  tags      = merge({ Name = "youtube-main-vpc-interface-for-nat" }, var.tags)
}
