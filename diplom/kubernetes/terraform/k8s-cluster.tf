
# Variables

variable "yc_token" {
  type = string
  description = "Yandex Cloud API key"
}

variable "yc_cloud_id" {
  type = string
  description = "Yandex Cloud id"
}

variable "yc_folder_id" {
  type = string
  description = "Yandex Cloud folder id"
}


resource "yandex_compute_instance" "k8s-master" {
  name = "k8s-master"
  hostname = "k8s-master"
  allow_stopping_for_update = true
  
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
      cores  = 2
      memory = 4
    }

    boot_disk {
      initialize_params {
        image_id = "fd8vmcue7aajpmeo39kk" 
        size     = 30
      }
    }
    network_interface {
    subnet_id = "${yandex_vpc_subnet.diplom-net-1.id}"
    nat       = true
    }

      metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
  
}


resource "yandex_compute_instance" "k8s-workers" {
  count = 2
  name = "k8s-worker-${count.index}"
  hostname = "k8s-worker-${count.index}"

  allow_stopping_for_update = true

  platform_id = "standard-v1"
  zone        = "ru-central1-b"

    resources {
      cores  = 2
      memory = 4
    }

    boot_disk {
      initialize_params {
        image_id = "fd8vmcue7aajpmeo39kk" 
        size     = 30

      }
    }

    network_interface {
      subnet_id = "${yandex_vpc_subnet.diplom-net-2.id}"
      nat = true
    }
      metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
}

# Output values

output "group_masters_public_ips" {
  description = "Public IP addresses for master-node"
  value = yandex_compute_instance.k8s-master.*.network_interface.0.nat_ip_address
}

output "group_masters_private_ips" {
  description = "Private IP addresses for master-node"
  value = yandex_compute_instance.k8s-master.*.network_interface.0.ip_address
}

output "group_workers_public_ips" {
  description = "Public IP addresses for worder-nodes"
  value = yandex_compute_instance.k8s-workers.*.network_interface.0.nat_ip_address
}

output "group_workers_private_ips" {
  description = "Private IP addresses for worker-nodes"
  value = yandex_compute_instance.k8s-workers.*.network_interface.0.ip_address
}
