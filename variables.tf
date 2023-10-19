variable "tags" {
  type = object({
    Project = string,
    Environment = string
  })

  default = {
    Project = "youtube-class"
    Environment = "dev"
  }
}

variable "public_subnets" {
  type = list(object({
    name                    = string,
    cidr_block              = string,
    map_public_ip_on_launch = bool,
    availability_zone       = string
  }))

  default = [{
    name                    = "youtube-main-vpc-public-subnet-1a"
    cidr_block              = "10.0.0.0/27"
    map_public_ip_on_launch = true
    availability_zone       = "us-east-1a"
    }]
}


variable "private_subnets" {
  type = list(object({
    cidr_block        = string,
    availability_zone = string
  }))

  default = [{
    name              = "youtube-main-vpc-private-subnet-1a"
    cidr_block        = "10.0.0.64/27"
    availability_zone = "us-east-1a"
    },
    {
    name              = "youtube-main-vpc-private-subnet-1b"
    cidr_block        = "10.0.0.96/27"
    availability_zone = "us-east-1b"
    }]
}

