# versions.tf in the root module directory

# Defines the minimum required Terraform CLI version.
# This ensures that anyone running this configuration is using a compatible Terraform version.
terraform {
  required_version = "~> 5.4.0" # Example: Require Terraform v1.5.0 or newer

  # Defines the providers this configuration needs, their source, and acceptable versions.
  # Terraform will automatically download these providers during 'terraform init'.
  required_providers {
    # Google Cloud Provider
    google = {
      source  = "hashicorp/google" # The official HashiCorp Google Cloud provider
      version = "~> 5.0"           # Example: Use any 5.x.x version (e.g., 5.0.0 up to < 6.0.0)
    }

    # Google Cloud Beta Provider (if you use beta features/resources)
    "google-beta" = { # Note: Provider names with hyphens must be quoted
      source  = "hashicorp/google-beta"
      version = "~> 6.0"           # Example: Use any 6.x.x version (e.g., 6.0.0 up to < 7.0.0)
    }

    # Random Provider (often used for generating unique names/suffixes)
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"           # Example: Use any 3.x.x version
    }

    # Add other providers here if your overall infrastructure uses them,
    # e.g., local, null, tls, etc.
  }

  # Configures the backend where Terraform will store its state file.
  # For GCP, Google Cloud Storage (GCS) is the recommended backend.
  # Replace 'your-globally-unique-tf-state-bucket-name' with the actual name
  # of your GCS bucket. This bucket must exist BEFORE you run 'terraform init'.
  backend "gcs" {
    bucket = "your-globally-unique-tf-state-bucket-name" # The GCS bucket name
    prefix = "terraform/state/jokefire"                 # Optional: A path within the bucket to store the state file
                                                         # This helps organize states for different environments/apps.
  }
}

# Provider configuration blocks.
# These blocks specify how Terraform will authenticate and interact with your cloud provider.
# You typically define project, region, and zone here using variables for flexibility.
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  # zone    = var.gcp_zone # Uncomment if you want to set a default zone at the root level
}

# If you need to use specific Google Cloud Beta features, you might define this provider.
# Make sure to declare it in the 'required_providers' block above as well.
provider "google-beta" {
  project = var.gcp_project_id
  region  = var.gcp_region
  # zone    = var.gcp_zone
}