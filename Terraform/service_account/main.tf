resource "google_project_iam_custom_role" "iam_role" {
  role_id     = var.iam_role_id
  title       = var.iam_role_title
  permissions = var.iam_role_permissions
}

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

resource "google_project_iam_member" "service_account_role_2" {
  project = var.service_account_project_id
  role    = "projects/${google_service_account.service_account.project}/roles/${google_project_iam_custom_role.iam_role.role_id}"  
  member  = "serviceAccount:${google_service_account.service_account.email}"
}