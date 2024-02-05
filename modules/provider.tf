terraform {
  required_version = "~>1.5.1"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.0.0, < 5.0.0"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.0.0, < 5.0.0"
    }
  }

  cloud {
    organization = "hca-healthcare"

    workspaces {
      tags = ["env:#{environment}#", "data-domain:clinical"]
    }
  }
}
