output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "web_public_ips" {
  value = module.compute.public_ips
}

output "web_names" {
  value = module.compute.names
}