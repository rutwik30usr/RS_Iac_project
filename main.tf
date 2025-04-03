module "vpc-stack" {
  source = "./modules/iaac"

  identifier            = "rutwik-1111"
  vpc_cidr_block        = "10.100.0.0/24"
  created_by            = "rutwik"
  private_subnet_cidr   = "10.100.0.0/26"
  public_subnet_cidr    = "10.100.0.64/26"
  private_subnet_cidr_2 = "10.100.0.128/26"
  public_subnet_cidr_2  = "10.100.0.192/26"
  public_subnet_az      = "ap-south-1a"
  private_subnet_az     = "ap-south-1b"

}
