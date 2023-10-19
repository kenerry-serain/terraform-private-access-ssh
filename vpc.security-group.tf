resource "aws_security_group" "allow_ssh" {
  name        = "allow-ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.youtube_main_vpc.id

  ingress {
    description      = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["177.139.19.189/32", "10.0.0.0/27"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "allow_rds" {
  name        = "allow-rds"
  description = "Allow rds inbound traffic"
  vpc_id      = aws_vpc.youtube_main_vpc.id

  ingress {
    description      = "RDS Access"
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.64/27"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_rds"
  }
}