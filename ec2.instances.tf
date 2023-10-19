data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "youtube_public_instance" {
  ami                    = data.aws_ami.ubuntu.id
  key_name               = "youtube-private-key"
  subnet_id              = aws_subnet.public_subnets[0].id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type          = "t3.micro"
  tags                   = merge({ Name = "youtube-public-instance" }, var.tags)
}

resource "aws_instance" "youtube_private_instance" {
  ami                    = data.aws_ami.ubuntu.id
  key_name               = "youtube-private-key"
  subnet_id              =  aws_subnet.private_subnets[0].id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_rds.id]
  instance_type          = "t3.micro"
  tags                   = merge({ Name = "youtube-private-instance" }, var.tags)
}

