resource "aws_instance" "ec2_ins1" {
  ami = var.ec2[var.location.region]
  instance_type = var.ec2.type
  key_name = aws_key_pair.ec2_keypair.id
  tags = {
    "Name" = var.name
  }
}
resource "aws_eip" "eip1" {
  vpc = true
  tags = {
    "Name" = var.name
  }
}
output "eip1" {
  value = aws_eip.eip1.public_ip
}
resource "aws_security_group" "sg1" {
  ingress {
    cidr_blocks = [ "${aws_eip.eip1.public_ip}/32" ]
    from_port = var.ports.http
    protocol = var.ports.protocol
    to_port = var.ports.http
  }
  tags = {
    "Name" = var.name
  }
}
/* resource "aws_s3_bucket" "bucket1" {
  bucket = "jas-test-20220915"
  tags = {
    "Name" = "bucket1"
  }
}
output "bucket1" {
  value = aws_s3_bucket.bucket1.bucket_domain_name
} */