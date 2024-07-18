## Declared VPC
resource "aws_vpc" "edwin_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.vpc_tenancy
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  enable_dns_support = var.vpc_enables_dns_support

  tags = {
    Name = var.vpc_name
  }
}

# Create Internet GW
resource "aws_internet_gateway" "edwin_gw" {
  vpc_id = aws_vpc.edwin_vpc.id

  tags = {
    Name = var.vpc_igw_name
  }
}

# Identifying VPC subnets 

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.edwin_vpc.id
  cidr_block = var.public_subnet_1_cidr_block
  availability_zone = var.public_subnet_1_az

  tags = {
    Name = var.public_subnet_1_name
  }
}


resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.edwin_vpc.id
  cidr_block = var.public_subnet_2_cidr_block
  availability_zone = var.public_subnet_2_az

  tags = {
    Name = var.public_subnet2_name
  }
}


# Route Tables

resource "aws_default_route_table" "edwin_edfault_route_table" {
  default_route_table_id = aws_vpc.edwin_vpc.default_route_table_id

  route {
    cidr_block = var.rt_cidr_block_igw
    gateway_id = aws_internet_gateway.edwin_gw.id
  }
  route {
    cidr_block = var.rt_local_cidr_block
    gateway_id = var.rt_local_gateway_id

  }

  tags = {
    Name = var.rt_name
  }
}
## Subnet association
resource "aws_route_table_association" "public_subnet_1_rt_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_default_route_table.edwin_edfault_route_table.id
}
resource "aws_route_table_association" "public_subnet_2_rt_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_default_route_table.edwin_edfault_route_table.id
}

## Default NACL

resource "aws_default_network_acl" "edwin_default_nacl" {
  default_network_acl_id = aws_vpc.edwin_vpc.default_network_acl_id
  subnet_ids = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = var.nacl_name
  }
}

## Security groups

resource "aws_default_security_group" "edwin_public_sg" {
  vpc_id = aws_vpc.edwin_vpc.id
  ingress {
    protocol  = "-1"
    from_port = 0
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.default_sg_name
  }
  
}