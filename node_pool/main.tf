resource "google_container_node_pool" "node_pool" {
  name       = var.node_pool_name
  location   = var.node_pool_location
  cluster    = var.node_pool_cluster
  node_count = var.node_pool_node_count

  upgrade_settings {
    max_surge       = var.node_pool_max_surge
    max_unavailable = var.node_pool_max_unavailable
  }

  management {
    auto_repair  = var.node_pool_management_auto_repair
    auto_upgrade = var.node_pool_management_auto_upgrade
  }

  node_config {
    preemptible     = var.node_pool_node_config_preemptible
    machine_type    = var.node_pool_node_machine_type
    disk_type       = var.node_pool_node_config_disk_type
    disk_size_gb    = var.node_pool_node_config_disk_size
    image_type      = var.node_pool_node_config_image_type
    service_account = var.node_pool_node_config_service_account
    oauth_scopes    = var.node_pool_node_config_oauth_scopes
  }
}