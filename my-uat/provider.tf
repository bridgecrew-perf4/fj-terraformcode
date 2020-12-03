terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization  = "boohoo-devops"

    workspaces {
      name        = "FJ-Workspace"
    }
  }
  /*
  required_providers {
    aws = {
      #version     = "~> 3.18.0"
      region       = "var.AWS_DEFAULT_REGION"
    }
  }
  */
}


provider "aws" {
  region = var.region
}