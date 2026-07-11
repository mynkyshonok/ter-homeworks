###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

#storage disk vars

variable "storage_disk" {
  type = object({
    count = number
    type  = string
    zone  = string
    size  = number
  })
}

#vm vars

variable "platform_id" {
  type        = string
  default     = "standard-v1"
}

variable "family_os_image" {
  type        = string
  default     = "ubuntu-2404-lts-oslogin"
}


variable "web_vm" {
  type = object({
    count         = number
    cores         = number
    memory        = number
    core_fraction = number
    disk_size     = number
    disk_type     = string
    nat           = bool
  })
}

variable "db_vm" {
  type = list(object({
    name          = string
    cores         = number
    memory        = number
    disk_size     = number
    core_fraction = number
    nat           = bool
  }))
}

variable "storage_vm" {
  type = object({
    name          = string
    hostname      = string
    cores         = number
    memory        = number
    core_fraction = number
    disk_size     = number
    disk_type     = string
    nat           = bool
  })
}

locals {
  ssh_public_key = file(pathexpand("~/.ssh/ssh-key-my.pub"))
}