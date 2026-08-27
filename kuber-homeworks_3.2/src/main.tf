resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_os
}

#создаем мастер
resource "yandex_compute_instance" "vm_master" {
  count = 1

  name        = "${var.vm_res[0].vm_name}${count.index + 1}"
  hostname    = "${var.vm_res[0].vm_name}${count.index + 1}"
  platform_id = var.vm_platform

  resources {
    cores         = var.vm_res[0].cpu
    memory        = var.vm_res[0].ram
    core_fraction = var.vm_res[0].core_fr
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.vm_res[0].disk_volume
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.public_key}"
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = var.vm_nat
  }
}

#создаем 4 ноды
resource "yandex_compute_instance" "vm_node" {
  count = 4

  name        = "${var.vm_res[1].vm_name}${count.index + 1}"
  hostname    = "${var.vm_res[1].vm_name}${count.index + 1}"
  platform_id = var.vm_platform

  resources {
    cores         = var.vm_res[1].cpu
    memory        = var.vm_res[1].ram
    core_fraction = var.vm_res[1].core_fr
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.vm_res[1].disk_volume
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.public_key}"
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = var.vm_nat
  }
}
