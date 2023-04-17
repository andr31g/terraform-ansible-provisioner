             variable path_separator { default = "/" }
             variable fqdn_separator { default = "." }

                     variable inputs { default = "inputs" }

             variable cloud_init_iso { default = "cloudinit-focal-server0.iso" }
       variable cloud_init_templates { default = "cloud-init/templates" }
        variable cloud_init_template { default = "cloud_init_focal.tpl" }

           variable netplan_template { default = "network.tpl" }

           variable ansible_username { default = "ansible" }
         variable ansible_key_public { default = "ssh/ansible.pub" }
        variable ansible_key_private { default = "ssh/ansible.priv" }
    variable ansible_provisioner_dir { default = "ansible" }
  variable ansible_playbook_template { default = "install.yml.tpl" }
      variable ansible_playbook_file { default = "install.yml"}
        variable ansible_config_file { default = "ansible.cfg" }

         variable agent_program_file { default = "security_agent_installer_linux_amd64_v1.0.0.sh" }
      variable agent_config_template { default = "security_agent_config.conf.tpl" }
          variable agent_config_file { default = "security_agent_config.conf" }
           variable agent_token_file { default = "agent/token.txt" }
