terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.4.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
}