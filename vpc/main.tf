resource "google_compute_network" "vpc_network" {
  project                 = var.vpc_project_id
  name                    = var.vpc_name
  auto_create_subnetworks = var.vpc_auto_create_subnetworks
  mtu                     = var.vpc_mtu
  routing_mode            = var.vpc_routing_mode
}