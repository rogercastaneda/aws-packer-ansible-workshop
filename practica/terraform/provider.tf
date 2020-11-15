provider "aws" {
  profile = "aws-workshop"
  region  = "us-east-1"
  alias   = "workshop"
}
provider "aws" {
  profile = "aws-workshop"
  region  = "us-east-1"
}
