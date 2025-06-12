resource "google_storage_bucket" "GCS1" {
  name                        = var.bucket_name
  location                    = var.location
  storage_class               = var.storage_class
  uniform_bucket_level_access = var.uniform_bucket_level_access
  force_destroy               = var.force_destroy

  labels = {
    environment = "development"
    owner       = "tim_dunphy"     # You can use your name/email
    project_app = "terraform-test" # A label specific to your application
    cost_center = "marketing"      # Example for cost allocation
  }

}