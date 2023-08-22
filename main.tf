

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}
provider "aws" {
  region = "ap-northeast-1"
}
# we are using the terraform vpc module directly
module "public_vpc" {
  source = "terraform-aws-modules/vpc/aws"
  
  name = "my-public-vpc"
  
  cidr = "10.0.0.0/16"
  
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  
  enable_nat_gateway = true
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
