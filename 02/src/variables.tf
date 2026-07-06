###cloud vars


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
  description = "VPC network & subnet name"
}


###ssh vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQEBsuGhFPoeUjEnM2r2Wl9pcvYaADKktMrIgZyMwKZylXqMTU5Lm+YKpzMdxbUXWZMDzijgPBHHjM7mm983FBF8hjDCMCtCvsi3PUAQvjrEsDFWwb/cUCLxxcKezbSXbH8R6cCJfd6PQVfiwTTcFOZM+fFXGsX9dXE/oMOxTeSJ5837lcl2KA1+xmLlkKRZaahZK2jNNoH+v6O9ONf2jz7hzOHbyHCm6UzLtMEW8ShbllIW8e70x93oA3z/50qdJ/awJT2HcJOh9U1a9tjOW3zqkrYcZxEzn0I1chfidSDeHagmca8Xf7FaqYjE1zoK4rrwF5homuIjME0WZFuEyp"
#  description = "ssh-keygen -t ed25519"
#}

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "image family"
}

variable "env" {
  type        = string
  default     = "develop"
  description = "env"
}

variable "role1" {
  type        = string
  default     = "web"
  description = "env"
}

variable "role2" {
  type        = string
  default     = "db"
  description = "env"
}

variable "vms_resources" {
  description = "Ресурсы вм"
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
}

variable "metadata" {
  description = "Метаданные для вм"
  type        = map(string)
}