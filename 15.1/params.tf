variable "nat_image" {
  default = "fd80mrhj8fl2oe87o4e1"
}

variable "vm_image" {
  default = "fd8k3a6rj9okseiqrl3k"
}

variable "nat_ip" {
  default = "192.168.10.254"
}

variable "token" {
  description   = "token"
  type          = string
  default = "***"
}

variable "cloud_id" {
  default = "***"
}

variable "folder_id" {
  default = "***"
}

variable "zone" {
  default = "ru-central1-b"
}
