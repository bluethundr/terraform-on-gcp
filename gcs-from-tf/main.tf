resource "google_storage_bucket" "GCS1" {
    name = "bucket-from-terraform-tim-dunphy-2025"
    location = "us-central1"
    storage_class = "STANDARD"
    uniform_bucket_level_access = true

    labels = {
        environment = "development"
        owner       = "tim_dunphy" # You can use your name/email
        project_app = "terraform-test"   # A label specific to your application
        cost_center = "marketing"  # Example for cost allocation
  }

}

resource "google_storage_bucket_object" "photo" {
     name = "devops photo"
     bucket = google_storage_bucket.GCS1.name
     source = "devops.png"
}