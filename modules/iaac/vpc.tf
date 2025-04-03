#this is our main vpc
resource "aws_vpc" "Rs-main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    name       = "rs-${var.identifier}-main"
    created_by = var.created_by
  }

}

#vpc public subnet in AZ ap-south-1a
resource "aws_subnet" "rs_public" {
  vpc_id            = aws_vpc.Rs-main.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.public_subnet_az

  tags = {
    name       = "public-${var.identifier}-subnet"
    created_by = var.created_by
  }
}

#vpc private subnet in AZ ap-south-1a
resource "aws_subnet" "rs_private" {
  vpc_id            = aws_vpc.Rs-main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.private_subnet_az

  tags = {
    name       = "private-${var.identifier}-subnet"
    created_by = var.created_by
  }

}


#vpc private subnet in AZ ap-south-1b
resource "aws_subnet" "rs_public_2" {
  vpc_id            = aws_vpc.Rs-main.id
  cidr_block        = var.public_subnet_cidr_2
  availability_zone = var.public_subnet_az

  tags = {
    name       = "public-${var.identifier}- subnet-2"
    created_by = var.created_by
  }
}

#vpc private subnet in AZ ap-south-1b

resource "aws_subnet" "rs_private_2" {
  vpc_id            = aws_vpc.Rs-main.id
  cidr_block        = var.private_subnet_cidr_2
  availability_zone = var.private_subnet_az

  tags = {
    name       = "private -${var.identifier}-subnet-2"
    created_by = var.created_by
  }

}

resource "aws_internet_gateway" "rs-main-igw" {
  vpc_id = aws_vpc.Rs-main.id
}



resource "aws_route_table" "rs-public-rt" {
  vpc_id = aws_vpc.Rs-main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.rs-main-igw.id

  }

  tags = {
    name       = "public-${var.identifier}-route table"
    created_by = var.created_by
  }

}

resource "aws_route_table" "rs-private-rt" {
  vpc_id = aws_vpc.Rs-main.id


  tags = {
    name       = "private -${var.identifier}-route table"
    created_by = var.created_by
  }

}

resource "aws_route_table_association" "rs-public-association" {
  subnet_id      = aws_subnet.rs_public.id
  route_table_id = aws_route_table.rs-public-rt.id

}

resource "aws_route_table_association" "rs-private-association" {
  subnet_id      = aws_subnet.rs_private.id
  route_table_id = aws_route_table.rs-private-rt.id
}

resource "aws_route_table_association" "rs-public-association-2" {
  subnet_id      = aws_subnet.rs_public_2.id
  route_table_id = aws_route_table.rs-public-rt.id

}

resource "aws_route_table_association" "rs-private-association-2" {
  subnet_id      = aws_subnet.rs_private_2.id
  route_table_id = aws_route_table.rs-private-rt.id
}