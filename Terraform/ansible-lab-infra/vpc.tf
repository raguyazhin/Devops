# ---------------------------------------------------------------------------------------------------------------------
# VPC
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_vpc" "ansible-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "ansible-vpc"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# PRIVATE SUBNETS
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_subnet" "private" {
  cidr_block = "10.0.0.0/24"
  vpc_id     = aws_vpc.ansible-vpc.id
  tags = {
    Name = "ansible-vpc-private-subnet-1"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# PUBLIC SUBNETS
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_subnet" "public" {
  cidr_block              = "10.0.1.0/24"
  vpc_id                  = aws_vpc.ansible-vpc.id
  map_public_ip_on_launch = true
  tags = {
    Name = "ansible-vpc-public-subnet-1"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# INTERNET GATEWAY
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ansible-vpc.id
  tags = {
    Name = "ansible-vpc-igw"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# ELASTIC IP
# ---------------------------------------------------------------------------------------------------------------------

# resource "aws_eip" "eip" {
#   vpc        = true
#   depends_on = [aws_internet_gateway.igw]
#   tags = {
#     Name = "ansible-vpc-eip"
#   }
# }

# ---------------------------------------------------------------------------------------------------------------------
# NAT GATEWAY
# ---------------------------------------------------------------------------------------------------------------------

# resource "aws_nat_gateway" "nat" {
#   subnet_id     = aws_subnet.public.id
#   allocation_id = aws_eip.eip.id
#   tags = {
#     Name = "ansible-vpc-ngw"
#   }
# }

# ---------------------------------------------------------------------------------------------------------------------
# ROUTE FOR PUBLIC SUBNETS
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_route_table" "public-route-table" {

  vpc_id = aws_vpc.ansible-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "ansible-vpc-public-rt"
  }

}

resource "aws_route_table_association" "public-route-association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public-route-table.id
}

# ---------------------------------------------------------------------------------------------------------------------
# PRIVATE ROUTE TABLE
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_route_table" "private-route-table" {

  vpc_id = aws_vpc.ansible-vpc.id

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat.id
#   }

  tags = {
    Name = "ansible-vpc-private-rt"
  }
}


resource "aws_route_table_association" "private-route-association" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private-route-table.id
}
