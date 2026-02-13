terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terraromf-s3-iac-ecs-retos"
    key            = "dev/ecs-terraform.tfstate"
    region         = "us-east-1"
  }


}

provider "aws" {
  region = var.aws_region
}
