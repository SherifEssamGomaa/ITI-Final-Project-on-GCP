variable "cluster_name" {
  type = string
}

variable "cluster_location" {
  type = string
}

variable "cluster_network" {
  type = string
}

variable "cluster_subnetwork" {
  type = string
}

variable "cluster_release_channel" {
  type = string
}

variable "cluster_remove_default_node_pool" {
  type = bool
}

variable "cluster_initial_node_count" {
  type = number
}

variable "cluster_enable_private_nodes" {
  type = bool
}

variable "cluster_enable_private_endpoint" {
  type = bool
}

variable "cluster_master_ipv4_cidr_block" {
  type = string
}

variable "cluster_ipv4_cidr_block" {
  type = string
}

variable "cluster_services_ipv4_cidr_block" {
  type = string
}

variable "cluster_master_authorized_networks_displayname" {
  type = string
}

variable "cluster_master_authorized_networks_cidr_block" {
  type = string
}

variable "cluster_horizontal_pod_autoscaling_disabled" {
  type = bool
}

variable "cluster_http_load_balancing_disabled" {
  type = bool
}

variable "cluster_node_config_service_account" {
  type = string
}

variable "cluster_node_config_oauth_scopes" {
  type = list
}