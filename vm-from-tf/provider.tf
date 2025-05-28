terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "5.38.0"
        }    
    }
}


provider "google" {
    project     = "terraform-461115"
    region      = "us-central1"
    zone        = "us-central1-a"
    credentials = "keys.json"
}