resource "google_compute_subnetwork" "subnetwork" {
  name                      = var.subnetwork_name
  ip_cidr_range             = var.subnetwork_cidr
  network                   = var.subnetwork_network 
  region                    = var.subnetwork_region
  private_ip_google_access  = var.subnetwork_private_ip_google_access
}