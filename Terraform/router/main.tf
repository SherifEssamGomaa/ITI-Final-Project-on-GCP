resource "google_compute_router" "router" {
  name    = var.router_name
  network = var.router_network
  region  = var.router_region
}