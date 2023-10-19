resource "aws_internet_gateway" "youtube_internet_gateway" {
  vpc_id = aws_vpc.youtube_main_vpc.id
  tags = merge({ Name = "youtube-main-vpc-internet-gateway" }, var.tags)
}
