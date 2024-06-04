
output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "vnet_id" {
  value = module.virtual_network.vnet_id
}

output "subnet_id" {
  value = module.virtual_network.subnet_id
}
