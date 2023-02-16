variable "rule_project_id" {
  type = string
}

variable "rule_name" {
  type = string
}

variable "rule_description" {
  type = string
}

variable "rule_network" {
  type = string
}

variable "rule_priority" {
  type = number
}

variable "rule_direction" {
  type = string
}

variable "rule_direction_protocol" {
  type = string
}

variable "rule_direction_ports" {
  type = list
}

variable "rule_soure_ranges" {
  type = list
}