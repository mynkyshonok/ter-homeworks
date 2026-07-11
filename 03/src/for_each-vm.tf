resource "yandex_compute_instance" "db_vm" {
 
  for_each = { for vm in var.db_vm : vm.name => vm }

  name        = "db-${each.key}"
  platform_id = var.platform_id

  resources {
    cores  = each.value.cores
    memory = each.value.memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2404-lts.image_id
      size     = each.value.disk_size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = each.value.nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  allow_stopping_for_update = true
}