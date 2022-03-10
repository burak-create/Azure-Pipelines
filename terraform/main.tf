# Defining Azure Provider source and the version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

locals {
  container_registery_name = format("cr%s%s%s0001", var.prefix, var.environment, var.region)
  app_service_plan_name    = format("plan-%s-%s-%s-0001", var.prefix, var.environment, var.region)
  app_service_name         = format("aser-%s-%s-%s-0001", var.prefix, var.environment, var.region)
  insights_name            = format("appi-%s-%s-%s-0001", var.prefix, var.environment, var.region)
  # resource_group_name      = format("rg-%s-%s-%s-0001", var.prefix, var.environment, var.region)
}

# Generate a random integer to create a globally unique name
# resource "random_integer" "ri" {
#  min = 10000
#  max = 99999
# }

# Create the resource group
#resource "azurerm_resource_group" "rg" {
#  name     = "${local.resource_group_name}"
#  location = "${var.resource_group_location}"
# 
#}

# Create the Azure container registery
resource "azurerm_container_registry" "acr" {

  name                  = "${local.container_registery_name}"
  resource_group_name   = "${var.resource_group_name}"
  location              = "${var.resource_group_location}"
  sku                   = "${var.container_registery_sku}"
  admin_enabled         = true # Default false
}

# Create the Linux App Service Plan
# -${random_integer.ri.result}
resource "azurerm_app_service_plan" "appserviceplan" {

  name                  = "${local.app_service_plan_name}"
  location              = "${var.resource_group_location}"
  resource_group_name   = "${var.resource_group_name}"
  kind                    = "Linux"
  reserved                = true
  sku {
    tier = "${var.app_service_plan_tier}"
    size = "${var.app_service_plan_size}"
  }
}

# Create the web app, pass in the App Service Plan ID, and deploy code from a container registery
# -${random_integer.ri.result}
resource "azurerm_app_service" "webapp" {

  name                  = "${local.app_service_name}"
  location                = "${var.resource_group_location}"
  resource_group_name     = "${var.resource_group_name}"
  app_service_plan_id     = azurerm_app_service_plan.appserviceplan.id
  https_only              = false
  client_affinity_enabled = false

  site_config {
    scm_type                  = null
    always_on                 = false
    use_32_bit_worker_process = null
    health_check_path = null
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_PASSWORD" = azurerm_container_registry.acr.admin_password
    "DOCKER_REGISTRY_SERVER_URL"      = azurerm_container_registry.acr.login_server
    "DOCKER_REGISTRY_SERVER_USERNAME" = azurerm_container_registry.acr.admin_username
    sensitive = true
  }

  identity {
   type         = "SystemAssigned" 
  }

  logs {
    http_logs {
      file_system {
        retention_in_days = 5
        retention_in_mb = 35
      }
    }
  }

}

resource "azurerm_application_insights" "insights" {

  name                = "${local.insights_name}"
  location            = "${var.resource_group_location}"
  resource_group_name = "${var.resource_group_name}"
  application_type    = "web"
}