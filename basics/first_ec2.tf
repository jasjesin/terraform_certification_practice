resource "aws_instance" "ec2" {
  ami = var.ec2[var.location.region]
  instance_type = var.ec2.type
  key_name = aws_key_pair.ec2_keypair.id

  tags = {
    "Name" = "ec2_ins"
  }
}