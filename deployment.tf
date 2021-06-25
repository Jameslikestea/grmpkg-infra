resource "aws_instance" "public1" {
  ami                    = lookup(var.AMI, var.AWS_REGION)
  instance_type          = "t3a.small"
  subnet_id              = aws_subnet.production-subnet-1.id
  vpc_security_group_ids = [aws_security_group.ssh-allowed.id]
  key_name               = aws_key_pair.london-region-keypair.id

  tags = {
    Name        = "public1"
    Environment = "production"
    Project     = "grmpkg"
  }
}

resource "aws_key_pair" "london-region-keypair" {
  key_name   = "london-region-keypair"
  public_key = "${file(var.PUBLIC_KEY_PATH)}"
}