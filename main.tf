module "vpc_network" {
  source                      = "./vpc"
  vpc_project_id              = var.project_id
  vpc_name                    = "vpc-network"
  vpc_auto_create_subnetworks = false
  vpc_mtu                     = 1460
  vpc_routing_mode            = "REGIONAL"
}

module "firewall_rule" {
  source                  = "./firewall_rule"
  rule_project_id         = var.project_id
  rule_name               = "firewall-rule"
  rule_description        = "firewall rule to allow ingress"
  rule_network            = module.vpc_network.vpc_id
  rule_priority           = 100
  rule_direction          = "INGRESS"
  rule_direction_protocol = "tcp"
  rule_direction_ports    = ["22"]
  rule_soure_ranges       = ["0.0.0.0/0"]
}

module "subnetwork" {
  source                              = "./subnetwork"
  subnetwork_name                     = "subnetwork"
  subnetwork_cidr                     = "10.0.1.0/24"
  subnetwork_network                  = module.vpc_network.vpc_id
  subnetwork_region                   = var.region
  subnetwork_private_ip_google_access = true
}

module "router" {
  source         = "./router"
  router_name    = "router"
  router_network = module.vpc_network.vpc_id
  router_region  = var.region
}

module "routr_nat" {
  source                                 = "./router_nat"
  nat_name                               = "nat"
  nat_router                             = module.router.router_name
  nat_region                             = var.region
  nat_ip_allocate_option                 = "AUTO_ONLY"
  nat_source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

module "service_account" {
  source                       = "./service_account"
  service_account_project_id   = var.project_id
  service_account_account_id   = "service-account"
  service_account_display_name = "service_account"
}

module "vm_instance" {
  source                             = "./vm_instance"
  instance_allow_stopping_for_update = true
  instance_name                      = "vm-instance"
  instance_machine_type              = "e2-medium"
  instance_zone                      = var.zone
  instance_service_account_email     = module.service_account.service_account_email
  instance_service_account_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
  instance_boot_disk_image           = "ubuntu-os-cloud/ubuntu-2204-lts"
  instance_boot_disk_type            = "pd-ssd"
  instance_boot_disk_size            = 50
  instance_network                   = module.vpc_network.vpc_id
  instance_subnetwork                = module.subnetwork.subnetwork_id
  depends_on = [
    module.cluster
  ]
}

module "cluster" {
  source                                         = "./cluster"
  cluster_name                                   = "cluster"
  cluster_location                               = var.zone
  cluster_network                                = module.vpc_network.vpc_id
  cluster_subnetwork                             = module.subnetwork.subnetwork_id
  cluster_release_channel                        = "REGULAR"
  cluster_remove_default_node_pool               = true
  cluster_initial_node_count                     = 1
  cluster_enable_private_nodes                   = true
  cluster_enable_private_endpoint                = true
  cluster_master_ipv4_cidr_block                 = "172.16.0.0/28"
  cluster_ipv4_cidr_block                        = "192.168.0.0/16"
  cluster_services_ipv4_cidr_block               = "10.96.0.0/16"
  cluster_master_authorized_networks_displayname = "subnetwork"
  cluster_master_authorized_networks_cidr_block  = "10.0.1.0/24"
  cluster_horizontal_pod_autoscaling_disabled    = false
  cluster_http_load_balancing_disabled           = true
  cluster_node_config_service_account            = module.service_account.service_account_email
  cluster_node_config_oauth_scopes = [
    "https://www.googleapis.com/auth/cloud-platform"
  ]
}

module "node_pool" {
  source                                = "./node_pool"
  node_pool_name                        = "node-pool"
  node_pool_location                    = var.zone
  node_pool_cluster                     = module.cluster.cluster_id
  node_pool_node_count                  = 1
  node_pool_max_surge                   = 1
  node_pool_max_unavailable             = 0
  node_pool_management_auto_repair      = true
  node_pool_management_auto_upgrade     = true
  node_pool_node_config_preemptible     = true
  node_pool_node_machine_type           = "e2-medium"
  node_pool_node_config_disk_type       = "pd-standard"
  node_pool_node_config_disk_size       = 50
  node_pool_node_config_image_type      = "COS_CONTAINERD"
  node_pool_node_config_service_account = module.service_account.service_account_email
  node_pool_node_config_oauth_scopes = [
    "https://www.googleapis.com/auth/cloud-platform"
  ]
}