output "private_key_pem" {
  value     = tls_private_key.key.private_key_pem
  sensitive = true
}

output "public_key_pem" {
  value = tls_private_key.key.public_key_openssh
}

output "jumpbox_public_ip" {
  value = module.jumpbox.public_ip
}

output "server_private_ip" {
  value = module.server.private_ip
}

output "node_0_private_ip" {
  value = module.node_0.private_ip
}

output "node_1_private_ip" {
  value = module.node_1.private_ip
}

output "server_dns" {
  value = module.server.private_dns
}


output "node_0_dns" {
  value = module.node_0.private_dns
}

output "node_1_dns" {
  value = module.node_1.private_dns
}
