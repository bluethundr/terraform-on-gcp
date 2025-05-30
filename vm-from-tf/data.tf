data "terraform_remote_state" "sa_state" {
  backend = "gcs"
  config = {
    bucket = "my-terraform-state-bucket-461115" # Must match the bucket used in sa-from-tf
    prefix = "terraform/sa-from-tf"             # Must match the prefix used in sa-from-tf
  }
}