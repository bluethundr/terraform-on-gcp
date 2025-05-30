# provider.tf in sa-from-tf directory
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.4.0"
    }
  }
  required_version = ">= 0.13"
  backend "gcs" { # This is correct: where sa-from-tf stores its state
    bucket = "my-terraform-state-bucket-461115" # Replace with your unique bucket name
    prefix = "terraform/sa-from-tf"
  }
}
provider "google" {
  credentials = file("terraform_credentials.json") # Your explicit key for this module
  project     = var.project_id
  region      = "us-central1"
  zone        = "us-central1-a"
}