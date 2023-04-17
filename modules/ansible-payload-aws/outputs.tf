output "cloud_init_template_reified" {
  value = local.cloud_init_template_reified
}

output "ansible_username" {
  value = var.ansible_username
}

output "ansible_key_private" {
  value = local.ansible_key_private
}

output "ansible_config_file" {
  value = local.ansible_config_dst_file
}

output "ansible_playbook_file" {
  value = local.ansible_playbook_dst_file
}
