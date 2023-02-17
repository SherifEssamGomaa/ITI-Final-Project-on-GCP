variable "instance_name" {
  type = string
}

variable "instance_machine_type" {
  type = string
}

variable "instance_zone" {
  type = string
}

variable "instance_service_account_email" {
  type = string
}

variable "instance_service_account_scopes" {
  type = list
}

variable "instance_boot_disk_image" {
  type = string
}

variable "instance_boot_disk_size" {
  type = number
}

variable "instance_network" {
  type = string
}

variable "instance_subnetwork" {
  type = string
}

variable "instance_meta_data" {
  type = string
}