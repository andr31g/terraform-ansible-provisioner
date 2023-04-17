locals {
  agent_token_file_content = chomp(file(local.agent_token_file))

  cloud_init_template_reified = templatefile(local.cloud_init_template,
    {
                hostname = var.vm_name
      ansible_key_public = file(local.ansible_key_public)
    })
}

resource "local_file" "ansible-playbook" {
  filename = local.ansible_playbook_dst_file
  content = templatefile(local.ansible_playbook_template_src_file,
    {
            ansible_host = var.vm_public_ipv4
            unique_token = local.agent_token_file_content
       agent_config_file = local.agent_config_dst_file
      agent_program_file = local.agent_program_dst_file
    })
}

resource "local_file" "ansible-config-file" {
  filename = local.ansible_config_dst_file
  content = file(local.ansible_config_template_src_file)
}

resource "local_file" "agent-program-file" {
  filename = local.agent_program_dst_file
  content = file(local.agent_program_src_file)
}

resource "local_file" "agent-config-file" {
  filename = local.agent_config_dst_file
  content = templatefile(local.agent_config_template_src_file,
    {
      unique_token = local.agent_token_file_content
    })
}
