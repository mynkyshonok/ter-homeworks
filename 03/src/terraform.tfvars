web_vm = {
  count         = 2
  cores         = 2
  memory        = 1
  core_fraction = 20
  disk_size     = 10
  disk_type     = "network-hdd"
  nat           = false
}

db_vm = [
  {
    name          = "main"
    cores         = 2
    memory        = 1
    disk_size     = 10
    core_fraction = 20
    nat           = false
  },
  {
    name          = "replica"
    cores         = 2
    memory        = 2
    disk_size     = 10
    core_fraction = 20
    nat           = false
  }
]

storage_disk = {
  count = 3
  type  = "network-hdd"
  zone  = "ru-central1-a"
  size  = 1
}

storage_vm = {
  name     = "storage"
  hostname = "storage"
  cores         = 2
  memory        = 2
  core_fraction = 20
  disk_size     = 10
  disk_type     = "network-hdd"
  nat           = false
}