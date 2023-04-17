module "ansible-run" {
  source = "../modules/ansible-run"

  vm_instance_id = aws_instance.this.id
  vm_public_ipv4 = aws_instance.this.public_ip

  ansible_username = module.ansible-payload-aws.ansible_username
  ansible_key_private = module.ansible-payload-aws.ansible_key_private
  ansible_config_file = module.ansible-payload-aws.ansible_config_file
  ansible_playbook_file = module.ansible-payload-aws.ansible_playbook_file
}

module "ansible-payload-aws" {
  source = "../modules/ansible-payload-aws"

  vm_name = var.vm_name
  vm_public_ipv4 = aws_instance.this.public_ip

  inputs_dir_private = local.inputs_dir_private
  inputs_dir_public = local.inputs_dir_public
  working_dir = local.working_dir
}
