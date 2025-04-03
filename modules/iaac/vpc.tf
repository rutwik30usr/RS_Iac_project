resource "aws_vpc" "Rs-main" {
    cidr_block = "10.100.0.0/24"
    instance_tenancy = "default"

    tags = {
      name= "rs-main"
      created_by="Rutwik"
    }
  
}


resource "aws_subnet" "rs_public" {
    vpc_id = aws_vpc.Rs-main.id
    cidr_block = "10.100.0.0/26"

    tags = {
      name= "public subnet"
    }
}

resource "aws_subnet" "rs_private" {
    vpc_id = aws_vpc.Rs-main.id
    cidr_block = "10.100.1.0/26"

    tags = {
      name="private subnet"
    }
  
}