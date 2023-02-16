variable "vpc_project_id" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_auto_create_subnetworks" {
  type = bool
}

variable "vpc_mtu" {
  type = number
}

variable "vpc_routing_mode" {
  type = string
}