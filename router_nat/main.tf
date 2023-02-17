resource "google_compute_router_nat" "nat" {
  name                               = var.nat_name
  router                             = var.nat_router
  region                             = var.nat_region
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.nat_source_subnetwork_ip_ranges_to_nat
  subnetwork {
    name                    = var.nat_subnetwork_name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}