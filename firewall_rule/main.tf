resource "google_compute_firewall" "rule" {
  project     = var.rule_project_id
  name        = var.rule_name
  description = var.rule_description
  network     = var.rule_network 
  priority    = var.rule_priority
  direction   = var.rule_direction
  allow {
    protocol  = var.rule_direction_protocol
    ports     = var.rule_direction_ports
  }
  source_ranges = var.rule_soure_ranges
}