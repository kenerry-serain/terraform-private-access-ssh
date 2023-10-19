resource "aws_eip" "elastic_ip_1a" {
  domain = "vpc"
  tags   = merge({ Name = "youtube-elastic-ip-1a" }, var.tags)
}