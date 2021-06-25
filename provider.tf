provider "aws" {
  region = var.AWS_REGION
}

terraform {
  backend "s3" {
    bucket = "grmpkg-infra"
    key    = "grmpkg/eu-west-1/state"
    region = "eu-west-1"
  }
}