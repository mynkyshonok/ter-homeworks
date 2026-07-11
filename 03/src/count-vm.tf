resource "yandex_compute_instance" "Web" {
  depends_on = [yandex_compute_instance.db_vm]
  count = var.web_vm.count

  name        = "web-${count.index + 1}"
  hostname    = "web-${count.index + 1}"
  platform_id = var.platform_id

  resources {
    cores         = var.web_vm.cores
    memory        = var.web_vm.memory
    core_fraction = var.web_vm.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2404-lts.image_id
      type     = var.web_vm.disk_type
      size     = var.web_vm.disk_size
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.web_vm.nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
}