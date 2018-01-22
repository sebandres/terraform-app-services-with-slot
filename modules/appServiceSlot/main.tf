resource "azurerm_template_deployment" "webappslot" {
  count = "${var.ignore == "1" ? 0 : 1}"

  name                = "${var.application_name}-${var.environment}-Slot"
  resource_group_name = "${var.azure_resource_group_name}"
  template_body       = "${file("${path.module}/appServiceSlotWithAppSettings.json")}"

  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters {
    "slotName"     = "${var.environment}"
    "siteName"     = "${var.application_name}"
    "location"     = "${var.azure_location}"
    "appSettings1" = "${var.appSettings1}"
  }

  deployment_mode = "Incremental"
}
