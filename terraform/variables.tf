# Defining temporary variables
# Requested variables will be define on pipelines

# Workspaces could've uses instead of environment
variable "environment" {
  type      = string
  description  = "The Environment name, i.e dev, staging, qa, preprod, test, prod..."
}

variable "prefix" {
  default     = "eways"
  description = "A prefix for generate a name"
}

variable "region" {
  default     = "ne"
  description = "region name fore generate a name"
}

variable "instance_count" {
  type        = number
  description = "Number of instance to build"
  default     = 1
}

variable "sku_option" {
  default      = "Basic"
  description  = "payment method"
}

variable "resource_group_location" {
  default      = "northeurope"
  description  = "Source area"
}

variable "replica_group_location1" {
  default      = "northeurope"
  description  = "The Replica group location name, if exist"
}

variable "resource_group_name" {
  default      = "rg_lia_devops"
  description  = "The Resource Group name to be deployed"
}


variable "container_registery_sku" {
  default      = "Basic"
  description  = "Define SKU group for container registery, i.e Basic, Standart, Premium"
}


variable "app_service_plan_tier" {
  default      = "Basic"
  description  = "Defining Azure App Service Plan pricing tier"
}

variable "app_service_plan_size" {
  default      = "B1"
  description  = "The size of app service plan tier, ie F1, B1, P1V2, P2V2 etc..."
}