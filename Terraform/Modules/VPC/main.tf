# Created VPC
resource "aws_vpc" "My_VPC" {
  cidr_block = "10.0.0.0/16"
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.My_VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public"
  }
}
# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.My_VPC.id
  cidr_block = "10.0.2.0/24"


  tags = {
    Name = "private"
  }
}
# Internet Gate way 
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.My_VPC.id

  tags = {
    Name = "main"
  }
}
# Public Rout Table
resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.My_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "main"
  }
}
# public Rout Table association
resource "aws_route_table_association" "public_rtb_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rtb.id
}

# Private Route Table
resource "aws_route_table" "private_rtb" {
  vpc_id = aws_vpc.My_VPC.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}



# private Rout Table association
resource "aws_route_table_association" "private_rtb_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rtb.id
}

# eLastic Ip
resource "aws_eip" "elp" {
  domain = "vpc"
}
# Create the NAT Gateway with explicit dependency
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.elp.id
  subnet_id     = aws_subnet.public_subnet.id

  # Explicit dependency ensures the Internet Gateway exists first
  depends_on = [aws_internet_gateway.gw]
}






