resource "aws_vpc" "production-vpc" {
  cidr_block           = "10.128.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  instance_tenancy     = "default"

  tags = {
    Name        = "production-vpc"
    Environment = "production"
    Project     = "grmpkg"
  }

}

resource "aws_subnet" "production-subnet-1" {
  vpc_id                  = aws_vpc.production-vpc.id
  cidr_block              = "10.128.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AWS_REGION}a"

  tags = {
    Name        = "production-subnet-1"
    Environment = "production"
    Project     = "grmpkg"
  }
}

resource "aws_subnet" "production-subnet-2" {
  vpc_id                  = aws_vpc.production-vpc.id
  cidr_block              = "10.128.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AWS_REGION}b"

  tags = {
    Name        = "production-subnet-2"
    Environment = "production"
    Project     = "grmpkg"
  }
}