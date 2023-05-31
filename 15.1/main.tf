terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token                    = var.token
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_instance" "vm-nat" {
  name =  "vm-nat"
  allow_stopping_for_update = true
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.nat_image
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet_public.id
    nat        = true
    ip_address = var.nat_ip
  }

  metadata = {
   ssh-keys = "vagrant:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3JHKRzcCXe7N38zSw0BU82azcGVCJHoDY/wZ0OFASdvMAGutn0DheViBYBx8oBD5YCm5XctMNa25TC5XRLaPIkeaII+EfKFJfadRPeFe2HxXcaIFP2bGnc7PNSuIDQgaE6nkTQ78ls6E0oxnK7ZVN0nlU3CJG6CcL/QhyZjfXTYoIQq2KP9wMJAlFMbvSFux60JeHyYqh9kGauHmNBcR1vcmscrHK5Kxm8wspwQNNFv6pB9Y1jOsbFbb6ub3Li+ByUOVWoBJYrP5qlFMUp7MlYMBDR9c8Ui+40rCKXmYAF32TfO6d5JaRMY9gZ0YJxwzA+dzQLKblIpcpv/RVwMcbrKAzw9OEkAvE5OzAFqKcyuRVjjZO4ZiOrjo1dAhexMAHkBKo1ra6gm8k6ICfGntK00nb3kaP9XhjFwInWIf7ljTumSWuCUfsqr6UquvUipSc8nTndNWej2VAkxAZZmF589zuAwOnVxOfYbj51XwzU7bLbTH2pXaGht5/EtpE4OE= vagrant@vagrant"
   }
}

resource "yandex_compute_instance" "vm-public" {
  name = "vm-public"
  allow_stopping_for_update = true
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_image
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet_public.id
    nat        = true
  }

  metadata = {
    ssh-keys = "vagrant:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3JHKRzcCXe7N38zSw0BU82azcGVCJHoDY/wZ0OFASdvMAGutn0DheViBYBx8oBD5YCm5XctMNa25TC5XRLaPIkeaII+EfKFJfadRPeFe2HxXcaIFP2bGnc7PNSuIDQgaE6nkTQ78ls6E0oxnK7ZVN0nlU3CJG6CcL/QhyZjfXTYoIQq2KP9wMJAlFMbvSFux60JeHyYqh9kGauHmNBcR1vcmscrHK5Kxm8wspwQNNFv6pB9Y1jOsbFbb6ub3Li+ByUOVWoBJYrP5qlFMUp7MlYMBDR9c8Ui+40rCKXmYAF32TfO6d5JaRMY9gZ0YJxwzA+dzQLKblIpcpv/RVwMcbrKAzw9OEkAvE5OzAFqKcyuRVjjZO4ZiOrjo1dAhexMAHkBKo1ra6gm8k6ICfGntK00nb3kaP9XhjFwInWIf7ljTumSWuCUfsqr6UquvUipSc8nTndNWej2VAkxAZZmF589zuAwOnVxOfYbj51XwzU7bLbTH2pXaGht5/EtpE4OE= vagrant@vagrant"
  }
}

resource "yandex_compute_instance" "vm-private" {
  name = "vm-private"
  allow_stopping_for_update = true
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_image
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet_private.id
  }

  metadata = {
    ssh-keys = "vagrant:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC3JHKRzcCXe7N38zSw0BU82azcGVCJHoDY/wZ0OFASdvMAGutn0DheViBYBx8oBD5YCm5XctMNa25TC5XRLaPIkeaII+EfKFJfadRPeFe2HxXcaIFP2bGnc7PNSuIDQgaE6nkTQ78ls6E0oxnK7ZVN0nlU3CJG6CcL/QhyZjfXTYoIQq2KP9wMJAlFMbvSFux60JeHyYqh9kGauHmNBcR1vcmscrHK5Kxm8wspwQNNFv6pB9Y1jOsbFbb6ub3Li+ByUOVWoBJYrP5qlFMUp7MlYMBDR9c8Ui+40rCKXmYAF32TfO6d5JaRMY9gZ0YJxwzA+dzQLKblIpcpv/RVwMcbrKAzw9OEkAvE5OzAFqKcyuRVjjZO4ZiOrjo1dAhexMAHkBKo1ra6gm8k6ICfGntK00nb3kaP9XhjFwInWIf7ljTumSWuCUfsqr6UquvUipSc8nTndNWej2VAkxAZZmF589zuAwOnVxOfYbj51XwzU7bLbTH2pXaGht5/EtpE4OE= vagrant@vagrant"
  }
}

