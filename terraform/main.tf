resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# resource "azurerm_virtual_network" "example" {
#   name                = var.vnet_name
#   address_space       = var.address_space
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

# locals {
#   subnets_map = { for subnet in var.subnets : subnet.name => subnet }
# }

# resource "azurerm_subnet" "example" {
#   for_each             = local.subnets_map
#   name                 = each.value.name
#   resource_group_name  = azurerm_resource_group.example.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = [each.value.address_prefix]

#   dynamic "delegation" {
#     for_each = each.value.delegation != null ? [each.value.delegation] : []
#     content {
#       name = delegation.value.name

#       service_delegation {
#         name    = delegation.value.service_delegation.name
#         actions = delegation.value.service_delegation.actions
#       }
#     }
#   }
# }