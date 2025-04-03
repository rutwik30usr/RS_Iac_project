variable "identifier" {
    description = "value to identify the resourse"
  
}


variable "vpc_cidr_block" {
    description = "value to assign cidr for vpc"
  
}


variable "created_by" {
    description = "value for created by, defualts to vpc module"
  
}


variable "public_subnet_cidr" {
    description = "value of public subnet cidr range"
  
}

variable "private_subnet_cidr" {
    description = "value of private subnet cidr range"
  
}


variable "public_subnet_cidr_2" {
    description = "value of public  2 subnet cidr range"
  
}

variable "private_subnet_cidr_2" {
    description = "value of private 2 subnet cidr range"
  
}


variable "public_subnet_az" {

description = "value of availability zones for public subnet "
  
}

variable "private_subnet_az" {

description = "value of availability zones for private subnet "
  
}