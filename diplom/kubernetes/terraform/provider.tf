terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  required_version = ">= 0.13"

  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "diplom-backet"
    region   = "ru-central1"
    key      = "tfstate"
    
    skip_region_validation      = true
    skip_credentials_validation = true
    workspace_key_prefix        = "workspaces"
  }
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id  
}

data "terraform_remote_state" "vpc" {
  backend   = "s3"
  workspace = terraform.workspace
  config    = {
    endpoint = "storage.yandexcloud.net"
    bucket   = "diplom-backet"
    region   = "ru-central1"
    key      = "tfstate"
    
    skip_region_validation      = true
    skip_credentials_validation = true
    workspace_key_prefix        = "workspaces"
  }
}