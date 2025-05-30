terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~> 5.4.0"
    }
  }
}

provider "google" {
    project = "terraform-461115"
    region = "us-central1"
    zone = "us-central1-a"
}