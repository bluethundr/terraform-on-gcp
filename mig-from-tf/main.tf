provider "google" {
    project = "del-mig-gcp"
    region = "us-central1"
    zone = "us-central1-b"
}

terraform {
    backend "gcs" {
       bucket = "td-mig-tf-backend"
       prefix = "terraform/state"
    }


}

