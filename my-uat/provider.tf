terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization  = "boohoo-devops"

    workspaces {
      name        = "FJ-Workspace"
    }
  }
}

provider "aws" {
  region = var.region
}