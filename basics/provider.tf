# The following new format helps us define multiple providers under same place, under 'required_providers' block >>
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
    github = {
      source = "integrations/github"
      version = "5.13.0"
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

 - Installing integrations/github v5.13.0...
 - Installed integrations/github v5.13.0 (signed by a HashiCorp partner, key ID 38027F80D7FD5FB2)

 Terraform has created a lock file .terraform.lock.hcl to record the provider
 selections it made above. Include this file in your version control repository
 so that Terraform can guarantee to make the same selections by default when
 you run "terraform init" in the future.

 Terraform has been successfully initialized! */

provider "aws" {
  region = var.location.region
}
provider "github" {
#  token = "${file(var.github.token)}"  <-- See how can we make this work to avoid secrets.tfvars
  token = var.github_token
}

/* Now since, github is a Partner provider, that is NOT directly maintained by Terraform, 
   so its plugin is loaded in a separate directory named 'integrations', while AWS is loaded under 'hashicorp'

jasdil@JasDiLMacAir terraform_certification_practice % tree .terraform/providers/registry.terraform.io/
.terraform/providers/registry.terraform.io/
├── hashicorp
│   └── aws
│       └── 3.76.0
│           └── darwin_amd64
│               └── terraform-provider-aws_v3.76.0_x5
└── integrations
    └── github
        └── 5.13.0
            └── darwin_amd64
                ├── CHANGELOG.md
                ├── LICENSE
                ├── README.md
                └── terraform-provider-github_v5.13.0

9 directories, 5 files
*/

resource "aws_key_pair" "ec2_keypair" {
    key_name = var.keypair.name
    public_key = "${file(var.keypair.path)}"
}

