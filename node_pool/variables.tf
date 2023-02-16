variable "node_pool_name" {
  type = string
}

variable "node_pool_location" {
  type = string
}

variable "node_pool_cluster" {
  type = string
}

variable "node_pool_node_count" {
  type = number
}

variable "node_pool_max_surge" {
  type = number
}

variable "node_pool_max_unavailable" {
  type = number
}

variable "node_pool_management_auto_repair" {
  type = bool
}

variable "node_pool_management_auto_upgrade" {
  type = bool
}

variable "node_pool_node_config_preemptible" {
  type = bool
}

variable "node_pool_node_machine_type" {
  type = string
}

variable "node_pool_node_config_disk_type" {
  type = string
}

variable "node_pool_node_config_disk_size" {
  type = number
}

variable "node_pool_node_config_image_type" {
  type = string
}

variable "node_pool_node_config_service_account" {
  type = string
}

variable "node_pool_node_config_oauth_scopes" {
  type = list
}