resource "aws_internet_gateway" "production-igw" {
  vpc_id = aws_vpc.production-vpc.id

  tags = {
    Name        = "production-igw"
    Environment = "production"
    Project     = "grmpkg"
  }
}

resource "aws_route_table" "production-public-route-table" {
  vpc_id = aws_vpc.production-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.production-igw.id
  }

  tags = {
    Name        = "production-public-route-table"
    Environment = "production"
    Project     = "grmpkg"
  }
}

resource "aws_route_table_association" "production-public-subnet-1-rt" {
  subnet_id      = aws_subnet.production-subnet-1.id
  route_table_id = aws_route_table.production-public-route-table.id
}

resource "aws_route_table_association" "production-public-subnet-2-rt" {
  subnet_id      = aws_subnet.production-subnet-2.id
  route_table_id = aws_route_table.production-public-route-table.id
}

resource "aws_security_group" "ssh-allowed" {
  vpc_id = aws_vpc.production-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "ssh-allowed"
    Environment = "production"
    Project     = "grmpkg"
  }
}