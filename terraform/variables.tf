variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

# variable "vnet_name" {
#   description = "The name of the virtual network"
#   type        = string
# }

# variable "address_space" {
#   description = "The address space of the virtual network"
#   type        = list(string)
# }

# variable "subnets" {
#   description = "A list of subnets to create"
#   type        = list(object({
#     name           = string
#     address_prefix = string
#     delegation     = optional(object({
#       name                = string
#       service_delegation  = object({
#         name    = string
#         actions = list(string)
#       })
#     }))
#   }))
# }