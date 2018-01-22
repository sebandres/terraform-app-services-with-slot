resource "azurerm_application_insights" "webapp" {
  name                = "${var.application_name}-ApplicationInsights"
  resource_group_name = "${var.azure_resource_group_name}"
  application_type    = "Web"

  # Not available in Australia
  location = "East US"
}

resource "azurerm_template_deployment" "webapp" {
  name                = "${var.application_name}-AppService"
  resource_group_name = "${var.azure_resource_group_name}"
  template_body       = "${file("${path.module}/appServiceWithAppSettings.json")}"

  # these key-value pairs are passed into the ARM Template's `parameters` block
  parameters {
    "hostingPlanName"                        = "${var.azure_appservice_plan}"
    "siteName"                               = "${var.application_name}"
    "location"                               = "${var.azure_location}"
    "applicationInsights_InstrumentationKey" = "${azurerm_application_insights.webapp.instrumentation_key}"
    "appSettings1"                           = "${var.appSettings1}"
  }

  deployment_mode = "Incremental"
}
