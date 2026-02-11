terraform {
  required_version = ">= 1.14.3"

  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "5.6.0"
    }
  }

  backend "cos" {
    region = "ap-nanjing"
    bucket = "terraform-1256528427"
    prefix = "dev/vault"
    key    = "vault.tfstate"
  }
}