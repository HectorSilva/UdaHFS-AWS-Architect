

resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
}

resource "aws_route_table" "public-route-table" {

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "CA-Public-Route-Table"
  }
}


resource "aws_route_table" "private-route-table" {

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "CA-Private-Route-Table"
  }
}


