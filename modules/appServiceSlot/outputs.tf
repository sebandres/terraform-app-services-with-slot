output "webappslot_name" {
  value = ["${azurerm_template_deployment.webappslot.*.name}"]
}
