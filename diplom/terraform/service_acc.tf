terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
  
  

}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id  
}

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


# Service accounts

resource "yandex_iam_service_account" "terraform-diplom" {
  name = "terraform-diplom"
}

resource "yandex_resourcemanager_folder_iam_binding" "editor" {
  folder_id = var.yc_folder_id
  role = "editor"
  members = [
    "serviceAccount:${yandex_iam_service_account.terraform-diplom.id}",
  ]
  depends_on = [
    yandex_iam_service_account.terraform-diplom,
  ]
}

resource "yandex_iam_service_account_static_access_key" "static-access-key" {
  service_account_id = yandex_iam_service_account.terraform-diplom.id
  depends_on = [
    yandex_iam_service_account.terraform-diplom,
  ]
}



# Backet for storing cluster backups

resource "yandex_storage_bucket" "diplom-backet" {
  bucket = "diplom-backet"
  force_destroy = true
  access_key = yandex_iam_service_account_static_access_key.static-access-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.static-access-key.secret_key
  depends_on = [
    yandex_iam_service_account_static_access_key.static-access-key
  ]
}

# Output values

output "current-workspace-name" {
  value = terraform.workspace
}

output "static-key-access-key" {
  description = "Access key for admin user"
  value = yandex_iam_service_account_static_access_key.static-access-key.access_key
}

output "static-key-secret-key" {
  description = "Secret key for admin user"
  value = yandex_iam_service_account_static_access_key.static-access-key.secret_key
  sensitive = true
}
