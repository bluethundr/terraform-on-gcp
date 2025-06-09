
terraform {
  backend "gcs" {
    bucket = "my-terraform-state-bucket-2555555"
    prefix = "terraform/state"
  }
}
