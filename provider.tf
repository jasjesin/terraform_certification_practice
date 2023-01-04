terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
/* Based on above specified source n minimum version, terraform init command reads this n outputs as >>
 jasdil@JasDiLMacAir practice % $terraform init
 Initializing the backend...
 Initializing provider plugins...

 - Finding hashicorp/aws versions matching "~> 3.0"...
 
 - Installing hashicorp/aws v3.76.0...
 - Installed hashicorp/aws v3.76.0 (signed by HashiCorp)

 Terraform has created a lock file .terraform.lock.hcl to record the provider
 selections it made above. Include this file in your version control repository
 so that Terraform can guarantee to make the same selections by default when
 you run "terraform init" in the future.

 Terraform has been successfully initialized! */

provider "aws" {
  region = var.location.region
}