resource "google_service_account" "service_account" {
    project      = var.service_account_project_id
    account_id   = var.service_account_account_id
    display_name = var.service_account_display_name
}

resource "google_project_iam_member" "service_account_role" {
  project = var.service_account_project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}