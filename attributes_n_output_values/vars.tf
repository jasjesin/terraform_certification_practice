variable "location" {
  type = map
  default = {
      region = "us-west-1"
      az1 = "us-west-1b"
      az2 = "us-west-1c"
  }
}
variable "ec2" {
    type = map
    default = {
        type = "t2.micro"
        us-west-1 = "ami-00d8a762cb0c50254"
    }
    
}
variable "keypair" {
    type = map
    default = {
    name = "us-region-key-pair"
    path = "/Users/jasdil/Documents/Learnings/terraform/creds/aws/us-region-key-pair.pub"
    }
}
variable "name" {
  default = "jas"
}
variable "ports" {
    type = map
    default = {
        http = 80
        ssl = 443
        ssh = 22
        open = 0
        protocol = "tcp"
    }
  
}