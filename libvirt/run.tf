module "ansible-run" {
  source = "../modules/ansible-run"

  vm_instance_id = libvirt_domain.this.id
  vm_public_ipv4 = var.vm_ip_address

  ansible_username = module.ansible-payload-libvirt.ansible_username
  ansible_key_private = module.ansible-payload-libvirt.ansible_key_private
  ansible_config_file = module.ansible-payload-libvirt.ansible_config_file
  ansible_playbook_file = module.ansible-payload-libvirt.ansible_playbook_file
}

module "ansible-payload-libvirt" {
  source = "../modules/ansible-payload-libvirt"

  vm_name = var.vm_name
  vm_fqdn = join(var.fqdn_separator, [var.vm_name], [var.vm_dns_domain])
  vm_public_ipv4 = var.vm_ip_address

  inputs_dir_private = local.inputs_dir_private
  inputs_dir_public = local.inputs_dir_public
  working_dir = local.working_dir

  vm_interface = var.vm_nic
  vm_ip_address = var.vm_ip_address
  vm_ip_mask = var.vm_ip_mask
  vm_dns_search = var.vm_dns_search
  vm_dns_server = var.vm_dns_server
  vm_default_gateway = var.vm_default_gateway
}
