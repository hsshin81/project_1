resource "azurerm_resource_group" "az-rg" {
  name     = "project_1_az_rg"
  location = "East US"
}


resource "azuread_user" "azuser1" {
  user_principal_name = "heesung.shin@fdmgroup.com"
  display_name        = "Heesung"
  mail_nickname       = "heesung"
  password            = "SecretP@sswd99!"
}


resource "azuread_user" "azuser2" {
  user_principal_name   = "ibrahim@fdmgroup.com"
  display_name          = "Ibrahim"
  mail_nickname         = "ibrahim"
  password              = "SecretP@sswd99!"
  force_password_change = true
}


resource "aws_iam_user" "awsuser" {
  for_each = toset(var.aws_users)
  name     = each.value

  tags = {
    team = "DevOps"
  }
}


resource "aws_s3_bucket" "b" {
  bucket = "${var.s3-bucket-name}-${count.index}"
  count  = var.bucket-count

  tags = {
    team = "DevOps"
  }
}


resource "azurerm_storage_account" "az-sa" {
  name                     = var.azure_storage_name
  resource_group_name      = azurerm_resource_group.az-rg.project_1_az_rg
  location                 = azurerm_resource_group.az-rg.eastus
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}


resource "azurerm_virtual_machine" "az-machine" {
  name                = var.azure_vm_name
  location            = azurerm_resource_group.az-rg.eastus
  resource_group_name = azurerm_resource_group.az-rg.project_1_az_rg
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size = "Standard_DS1_v2"

  tags = {
    environment = "staging"
  }
}


