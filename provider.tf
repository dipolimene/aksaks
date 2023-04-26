terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.53.0"
    }
  }

  required_version = ">= 1.1.0"

}


provider "azurerm" {
  # Configuration options
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

provider "helm" {

  kubernetes {
    config_path = "/path/to/kube_cluster.yaml"
  }
}


#AzureRM Backend to Store State File
terraform {
  backend "azurerm" {
    resource_group_name  = "dipolimene"
    storage_account_name = "dipolimenestorage"
    container_name       = "tfstate"
    key                  = "aks.terraform.tfstate"
  }
}

data "azurerm_client_config" "current" {}






