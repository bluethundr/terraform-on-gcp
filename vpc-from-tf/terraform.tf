terraform {
  backend "gcs" {
    bucket = "my-terraform-state-bucket-4611164646464642"
    prefix = "terraform/state"
  }
}