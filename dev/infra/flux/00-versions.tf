terraform {
  required_version = ">= 0.13"

  required_providers {
    flux = {
      source  = "fluxcd/flux"
      version = "1.7.6"
    }
    github = {
      source  = "integrations/github"
      version = "6.9.0"
    }
  }

  backend "cos" {
    region     = "ap-nanjing"
    bucket     = "terraform-1256528427"
    prefix     = "dev/flux"
    key        = "flux-1.tfstate"
  }
}
