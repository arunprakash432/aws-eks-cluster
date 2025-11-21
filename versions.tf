terraform {
  required_version = ">= 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # aws provider 6.x is current stable series as of Nov 2025
      version = ">= 6.0.0"
    }
  }
}