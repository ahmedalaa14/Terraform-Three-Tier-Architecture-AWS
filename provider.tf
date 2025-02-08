terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
    region = var.region 
    profile = "default"
    default_tags {
        tags = {
            environment = "dev"
            project = "terraform-demo"
        }
    }
}