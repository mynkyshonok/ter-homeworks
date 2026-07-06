# netology-develop-platform-web

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "vm name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "platform id"
}

#variable "vm_web_cores" {
#  type        = number
#  default     = 2
#  description = "cores"
#}

#variable "vm_web_memory" {
#  type        = number
#  default     = 1
#  description = "memory"
#}

#variable "vm_web_core_fraction" {
#  type        = number
#  default     = 5
#  description = "core fraction"
#}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "preemptible"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "nat"
}

#variable "vm_web_serial-port-enable" {
#  type        = number
#  default     = 1
#  description = "serial-port-enable"
#}

# netology-develop-platform-db

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "vm name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "platform id"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "zone"
}

#variable "vm_db_cores" {
#  type        = number
#  default     = 2
#  description = "cores"
#}

#variable "vm_db_memory" {
#  type        = number
#  default     = 2
#  description = "memory"
#}

#variable "vm_db_core_fraction" {
#  type        = number
#  default     = 20
#  description = "core fraction"
#}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "preemptible"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "nat"
}

#variable "vm_db_serial-port-enable" {
#  type        = number
#  default     = 1
#  description = "serial-port-enable"
#}

variable "vpc_name_db" {
  type        = string
  default     = "develop2"
  description = "vpc_name_db"
}

variable "cidr_db" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "cidr_db"
}