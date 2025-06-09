# iam.tf (Updated)

locals {
  service_account_member = "serviceAccount:${google_service_account.sa.email}" # <-- CHANGED: Now correctly references 'google_service_account.sa'
}

resource "google_project_iam_member" "sa_compute_admin" { # <-- CHANGED: Local name now uses 'sa' for consistency
  project = var.project_id
  role    = "roles/compute.admin"
  member  = local.service_account_member
}

resource "google_project_iam_member" "sa_project_iam_admin" { # <-- CHANGED
  project = var.project_id
  role    = "roles/resourcemanager.projectIamAdmin"
  member  = local.service_account_member
}

resource "google_project_iam_member" "sa_service_account_admin" { # <-- CHANGED
  project = var.project_id
  role    = "roles/iam.serviceAccountAdmin"
  member  = local.service_account_member
}

resource "google_project_iam_member" "sa_service_account_key_admin" { # <-- CHANGED
  project = var.project_id
  role    = "roles/iam.serviceAccountKeyAdmin"
  member  = local.service_account_member
}

resource "google_project_iam_member" "sa_storage_admin" { # <-- CHANGED
  project = var.project_id
  role    = "roles/storage.admin"
  member  = local.service_account_member
}