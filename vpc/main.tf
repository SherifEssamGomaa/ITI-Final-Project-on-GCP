resource "google_compute_network" "vpc_network" {
  project                 = var.vpc_project_id
  name                    = var.vpc_name
  auto_create_subnetworks = var.vpc_auto_create_subnetworks
  routing_mode            = var.vpc_routing_mode
}