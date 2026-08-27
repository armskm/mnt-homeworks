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

###vm vars

variable "vm_os" {
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "vm_platform" {
  type        = string
  default     = "standard-v1"
}

variable "vm_nat" {
  type        = bool
  default     = true
}

variable "vm_preemptible" {
  type        = bool
  default     = true
}

variable "vm_res" {
  type = list(object({  vm_name=string, cpu=number, ram=number, core_fr=number, disk_volume=number }))
  default = [
    {
      vm_name     = "master"
      cpu         = 2
      ram         = 4
      core_fr     = 20
      disk_volume = 20
    },
    {
      vm_name     = "node"
      cpu         = 2
      ram         = 2
      core_fr     = 20
      disk_volume = 20
    }
  ]
}

locals {
  public_key = file("/root/.ssh/id_rsa.pub")
}
