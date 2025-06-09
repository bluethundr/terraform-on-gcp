# provider.tf in vm-from-tf directory
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.4.0" 
    }
  }
  required_version = ">= 0.13"
}
provider "google" {
  project = "terraform-461115" # Hardcoded or var.project_id if declared here
  region  = "us-central1"
  zone    = "us-central1-a"
  # credentials = "keys.json" # This line MUST be commented out or removed
}