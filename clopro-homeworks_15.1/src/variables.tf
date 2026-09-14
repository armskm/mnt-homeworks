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


### Var vpc

variable "vpc_public" {
  type        = string
  default     = "public"
  description = "VPC network & subnet name"
}

variable "vpc_public_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_private" {
  type    = string
  default = "private"
}

variable "vpc_private_cidr" {
  type    = list(string)
  default = ["192.168.20.0/24"]
}

### Vm var

variable "vm_nat_image_id" {
  type    = string
  default = "fd80mrhj8fl2oe87o4e1"
}

variable "vm_nat_ip_address" {
  type    = string
  default = "192.168.10.254"
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_image
}

variable "vm_image" {
  type    = string
  default = "ubuntu-2204-lts"
}

variable "vm_platform_id" {
  type    = string
  default = "standard-v1"
}

# прерываемая
variable "vm_preemptible" {
  type    = bool
  default = true
}

# внешний ip
variable "vm_nat_enable" {
  type    = bool
  default = true
}

variable "vm_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    disk_size     = number
  }))
  default = {
    nat = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      disk_size     = 30
    },
    public = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      disk_size     = 30
    },
    private = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      disk_size     = 30
    }
  }
}

locals {
  public_key = file("/root/.ssh/id_rsa.pub")
}