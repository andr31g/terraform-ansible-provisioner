locals {
                cloud_init_templates = join(var.path_separator, [path.module, var.cloud_init_templates])
                 cloud_init_template = join(var.path_separator, [local.cloud_init_templates, var.cloud_init_template])

             ansible_provisioner_dir = join(var.path_separator, [path.module, var.ansible_provisioner_dir])
     ansible_provisioner_working_dir = join(var.path_separator, [var.working_dir, var.ansible_provisioner_dir])
       ansible_provisioner_dir_input = join(var.path_separator, [local.ansible_provisioner_dir, var.inputs])
  ansible_playbook_template_src_file = join(var.path_separator, [local.ansible_provisioner_dir, var.ansible_playbook_template])
           ansible_playbook_dst_file = join(var.path_separator, [local.ansible_provisioner_working_dir, var.ansible_playbook_file])
    ansible_config_template_src_file = join(var.path_separator, [local.ansible_provisioner_dir, var.ansible_config_file])
             ansible_config_dst_file = join(var.path_separator, [local.ansible_provisioner_working_dir, var.ansible_config_file])
                 ansible_key_private = join(var.path_separator, [var.inputs_dir_private, var.ansible_key_private])
                  ansible_key_public = join(var.path_separator, [var.inputs_dir_public, var.ansible_key_public])

      agent_config_template_src_file = join(var.path_separator, [local.ansible_provisioner_dir_input, var.agent_config_template])
               agent_config_dst_file = join(var.path_separator, [local.ansible_provisioner_working_dir, var.agent_config_file])
              agent_program_src_file = join(var.path_separator, [local.ansible_provisioner_dir_input, var.agent_program_file])
              agent_program_dst_file = join(var.path_separator, [local.ansible_provisioner_working_dir, var.agent_program_file])
                    agent_token_file = join(var.path_separator, [var.inputs_dir_private, var.agent_token_file])
}
