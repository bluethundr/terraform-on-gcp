# iam.tf
# This file defines the Identity and Access Management (IAM) permissions
# granted to the service account at the project level in Google Cloud.

# Local variable to construct the service account's member identifier.
# This ensures a consistent format (e.g., "serviceAccount:your-sa-id@your-project.iam.gserviceaccount.com").
# It correctly references the 'google_service_account.sa' resource defined in your sa.tf.
locals {
  service_account_member = "serviceAccount:${google_service_account.sa.email}"
}

# --- Project-Level IAM Bindings for the Service Account ---
# Each 'google_project_iam_member' resource grants a single predefined role
# to the service account within the specified Google Cloud Project.

# Grant the 'Cloud OS Config Service Agent' role.
# Note: This role (roles/osconfig.serviceAgent) is typically assigned to a Google-managed
# service agent automatically created when you enable the OS Config API.
# Granting it to a user-managed service account means that this SA can perform
# actions on behalf of the OS Config service. This is unusual for a user-managed SA
# but is included as per your explicit request.
resource "google_project_iam_member" "sa_os_config_service_agent" {
  project = var.project_id
  role    = "roles/osconfig.serviceAgent"
  member  = local.service_account_member
}

# Grant the 'Compute Admin' role.
# This role provides full control over Compute Engine resources.
resource "google_project_iam_member" "sa_compute_admin" {
  project = var.project_id
  role    = "roles/compute.admin"
  member  = local.service_account_member
}

# Grant the 'Compute Image User' role.
# This role allows the service account to use Compute Engine images.
resource "google_project_iam_member" "sa_compute_image_user" {
  project = var.project_id
  role    = "roles/compute.imageUser"
  member  = local.service_account_member
}

# Grant the 'Compute Instance Admin (v1)' role.
# This role allows the service account to manage Compute Engine instances.
resource "google_project_iam_member" "sa_compute_instance_admin_v1" {
  project = var.project_id
  role    = "roles/compute.instanceAdmin.v1"
  member  = local.service_account_member
}

# Grant the 'Editor' role.
# CAUTION: This is a broad role that allows viewing and modifying most resources within the project.
resource "google_project_iam_member" "sa_editor" {
  project = var.project_id
  role    = "roles/editor"
  member  = local.service_account_member
}

# Grant the 'Storage Object Admin' role.
# This role provides full control over objects within Cloud Storage buckets.
resource "google_project_iam_member" "sa_storage_object_admin" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"
  member  = local.service_account_member
}

# Grant the 'Storage Object Viewer' role.
# This role allows viewing objects within Cloud Storage buckets.
resource "google_project_iam_member" "sa_storage_object_viewer" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = local.service_account_member
}