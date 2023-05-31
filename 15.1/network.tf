resource "yandex_vpc_network" "vpc_network" {
  name = "vpc_network"
}

resource "yandex_vpc_subnet" "subnet_public" {
  name           = "public"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.vpc_network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_subnet" "subnet_private" {
  name           = "private"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.vpc_network.id
  v4_cidr_blocks = ["192.168.20.0/24"]
  route_table_id = yandex_vpc_route_table.subnet-private-route_table.id
}

resource "yandex_vpc_route_table" "subnet-private-route_table" {
  network_id = yandex_vpc_network.vpc_network.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"
  }
}

