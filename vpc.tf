resource "aws_vpc" "youtube_main_vpc" {
  cidr_block           = "10.0.0.0/24"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags                 = merge({ Name = "youtube-main-vpc" }, var.tags)
}
