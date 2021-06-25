variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMI" {
  type = map(string)
  default = {
    eu-west-1 = "ami-0a8e758f5e873d1c1"
    us-west-2 = "ami-03d5c68bab01f3496"
  }
}

variable "PUBLIC_KEY_PATH" {
  default = "./london-keypair.pub"
}