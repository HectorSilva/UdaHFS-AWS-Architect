resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Internet-Gateway"
  }
}

resource "aws_route_table_association" "public-rt-subnet-association1" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-rt-subnet-association2" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.public-route-table.id
}


resource "aws_internet_gateway_attachment" "ig-attach" {
  internet_gateway_id = aws_internet_gateway.gw.id
  vpc_id              = aws_vpc.vpc.id
}

resource "aws_subnet" "public-subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet1_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "Public subnet 1"
  }
}

resource "aws_subnet" "public-subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet2_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "Public subnet 2"
  }
}

resource "aws_subnet" "private-subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet1_cidr
  map_public_ip_on_launch = false

  tags = {
    Name = "Private subnet 1"
  }
}

resource "aws_subnet" "private-subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet2_cidr
  map_public_ip_on_launch = false

  tags = {
    Name = "Private subnet 2"
  }
}

resource "aws_security_group" "database-sg" {
  name = "database-security-group"
  description = "Allow DB inbound traffic"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description      = "Database Access"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "UDARR-Database"
  }
}

resource "aws_security_group" "app-sg" {
  name = "database-security-group"
  description = "Allow DB inbound traffic"
  vpc_id = aws_vpc.vpc.id

  ingress {
    description      = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "UDARR-Database"
  }
}