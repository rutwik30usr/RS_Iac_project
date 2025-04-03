/*this code is used to store terrform tf store on asw s3 bucket which is more imp in 
our terraform work*/


terraform {
  backend "s3" {
    bucket = "rg-rutwik-1111"
    key    = "rg-rutwik-1111/data/terraform.tfstate"
    region = "ap-south-1"
  }
}