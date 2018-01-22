resource "azurerm_resource_group" "appservicesResourceGroup" {
  name     = "${var.application_name}-AppServices"
  location = "${var.azure_location}"
}

module "rootAppService" {
  source = "modules/appService"

  application_name          = "${var.application_name}"
  environment               = "${var.environment}"
  azure_appservice_plan     = "${var.azure_appservice_plan}"
  azure_location            = "${var.azure_location}"
  azure_resource_group_name = "${azurerm_resource_group.appservicesResourceGroup.name}"
  appSettings1              = "ProductionValue"
}

module "slotAppService" {
  source = "modules/appServiceSlot"
  ignore = "${var.environment == "Production" ? "1" : "0"}"

  application_name          = "${var.application_name}"
  environment               = "${var.environment}"
  azure_appservice_plan     = "${var.azure_appservice_plan}"
  azure_location            = "${var.azure_location}"
  azure_resource_group_name = "${azurerm_resource_group.appservicesResourceGroup.name}"
  appSettings1              = "${var.appSettings1}"
}
