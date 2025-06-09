resource "google_storage_bucket" "GCS1" {
  name                        = "my-terraform-state-bucket-2555555"
  location                    = "us-central1"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  force_destroy               = true

  labels = {
    environment = "development"
    owner       = "tim_dunphy"     # You can use your name/email
    project_app = "terraform-test" # A label specific to your application
    cost_center = "marketing"      # Example for cost allocation
  }

}
