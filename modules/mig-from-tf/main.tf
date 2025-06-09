# main.tf

# --- Terraform Configuration Block ---
# This block must be at the top level. It configures Terraform itself.
terraform {
  required_version = ">= 1.0.0" # Good practice to specify a minimum Terraform version
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.4.0" # Ensure your provider version is here
    }
  }

  backend "gcs" {
    bucket = "td-mig-tf-backend"
    prefix = "terraform/state"
  }
}
# --- END Terraform Configuration Block ---


# --- Google Cloud Provider Configuration ---
# This block configures the Google Cloud provider.
provider "google" {
  project = "terraform-461115" # Consistent project for resources unless overridden
  region  = "us-central1"
  zone    = "us-central1-b" # Zone is for zonal resources, region for regional
                            # For global resources, neither is strictly needed.
                            # It's okay to define these here for provider defaults.
}


# --- Instance Template Resource ---
resource "google_compute_instance_template" "td-mig_template" {
  # Generally, let the provider's 'project' default unless you need to deploy
  # this specific resource to a *different* project.
  # project = "terraform-461115" # If this project is different from provider.project, keep it.
                              # If it's the same, you can remove this line.

  name         = "td-mig"
  machine_type = "f1-micro"

  disk {
    source_image = "debian-cloud/debian-11" # Or "ubuntu-os-cloud/ubuntu-2204-lts"
    auto_delete  = true
    boot         = true
    disk_size_gb = 20 # Or your desired size
  }

  network_interface {
    network = "default"

    access_config {
      network_tier = "PREMIUM"
    }
  }

  # --- Correctly placed service_account block for the instance template ---
  service_account {
    email  = "jf-webapp-dev@terraform-461115.iam.gserviceaccount.com"
    scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write", # Corrected typo (wwww -> www)
      "https://www.googleapis.com/auth/pubsub",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.suspend",
      "https://www.googleapis.com/auth/cloud-platform", # Very broad scope, grants access to almost everything.
    ]
  }
  # --- END service_account block ---
}

resource "google_compute_region_instance_group_manager" "instance_group_manager" {
    name = "td-mig-manager"
    base_instance_name = "test-td-mig"
    zone = "us-central1-b"
    version {
        instance_template = google_compute_instance_template.td-mig_template.self_linux
    }
    target_size = 2
}