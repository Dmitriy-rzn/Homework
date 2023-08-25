# Network

resource "yandex_vpc_network" "diplom-network" {
  name = "diplom-network"
}

resource "yandex_vpc_subnet" "diplom-net-1" {
  name           = "diplom-net1"
  zone           = "ru-central1-a"
  network_id = "${yandex_vpc_network.diplom-network.id}"
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_subnet" "diplom-net-2" {
  name           = "diplom-net2"
  zone           = "ru-central1-b"
  network_id = "${yandex_vpc_network.diplom-network.id}"
  v4_cidr_blocks = ["192.168.20.0/24"]
}

resource "yandex_vpc_subnet" "diplom-net-3" {
  name           = "diplom-net3"
  zone           = "ru-central1-c"
  network_id = "${yandex_vpc_network.diplom-network.id}"
  v4_cidr_blocks = ["192.168.30.0/24"]
}

