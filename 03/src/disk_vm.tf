resource "yandex_compute_disk" "storage_disks" {
  count = var.storage_disk.count
  name = "disk-${count.index}"
  type = var.storage_disk.type
  zone = var.storage_disk.zone
  size = var.storage_disk.size
}

resource "yandex_compute_instance" "storage" {

  name        = var.storage_vm.name
  hostname    = var.storage_vm.hostname
  platform_id = var.platform_id
  zone = var.storage_disk.zone
  resources {
    cores         = var.storage_vm.cores
    memory        = var.storage_vm.memory
    core_fraction = var.storage_vm.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2404-lts.image_id
      type     = var.storage_vm.disk_type
      size     = var.storage_vm.disk_size
    }
  }

  dynamic "secondary_disk" {
    for_each = { for disk in yandex_compute_disk.storage_disks : disk.name => disk.id }
    content {
      disk_id = secondary_disk.value
    }
  }


  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.storage_vm.nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
}