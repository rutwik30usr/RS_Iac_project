# i have created here s3 bucket to store data and teraform tf file.check 
#also tf.state file auto maticlly updated in mentined bucket after evry action.

resource "aws_s3_bucket" "Rg-rutwik" {
  bucket = "rg-rutwik-1111"

  tags = {
    name        = "my_bucket"
    envirnoment = "test"
  }

}