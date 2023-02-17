resource "google_container_cluster" "cluster" {
  name       = var.cluster_name
  location   = var.cluster_location
  network    = var.cluster_network
  subnetwork = var.cluster_subnetwork

  release_channel {
    channel = var.cluster_release_channel
  }

  remove_default_node_pool = var.cluster_remove_default_node_pool
  initial_node_count       = var.cluster_initial_node_count
  
  private_cluster_config {
    enable_private_nodes    = var.cluster_enable_private_nodes
    enable_private_endpoint = var.cluster_enable_private_endpoint
    master_ipv4_cidr_block  = var.cluster_master_ipv4_cidr_block
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.cluster_ipv4_cidr_block
    services_ipv4_cidr_block = var.cluster_services_ipv4_cidr_block 
  }

  master_authorized_networks_config {
    cidr_blocks {
      display_name = var.cluster_master_authorized_networks_displayname
      cidr_block   = var.cluster_master_authorized_networks_cidr_block
    }
  }

  addons_config {
    horizontal_pod_autoscaling {
        disabled = var.cluster_horizontal_pod_autoscaling_disabled
    }
    http_load_balancing {
        disabled = var.cluster_http_load_balancing_disabled
    }
  }

  node_config {
    service_account = var.cluster_node_config_service_account
    oauth_scopes    = var.cluster_node_config_oauth_scopes
  }

  workload_identity_config {
    workload_pool = "iti-sherif.svc.id.goog"
  }
}