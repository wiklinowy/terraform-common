data "azurerm_subscription" "current" {
}

locals {
  BU = lookup(data.azurerm_subscription.current.tags, "BU", null)
  Environment = lookup(data.azurerm_subscription.current.tags, "Environment", null)
}

resource "azurerm_resource_group" "rg" {
  for_each = var.rg

  name     = each.value
  location = var.location
  tags     = merge(var.metadata, {Name = each.value}, {BU = local.BU}, {Environment = local.Environment})
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}