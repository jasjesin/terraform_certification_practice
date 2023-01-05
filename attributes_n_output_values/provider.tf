# The following new format helps us define multiple providers under same place, under 'required_providers' block >>
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region = var.location.region
}
resource "aws_key_pair" "ec2_keypair" {
    key_name = var.keypair.name
    public_key = "${file(var.keypair.path)}"
}

