provider "aws" {
  region = "us-east-1"
  access_key = "AKIARHVQYNOLLJ2VTDIU"
  secret_key = "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"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.39"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}