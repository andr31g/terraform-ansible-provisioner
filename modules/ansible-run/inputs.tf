variable "vm_instance_id" {
  description = "Unique identier for the VM instance mananaged by 'ansible'."
  type = string
}

variable "vm_public_ipv4" {
  description = "Routable IPv4 address assigned to the VM managed by 'ansible'."
  type = string
}

variable "ansible_username" {
  description = "User name associated with the SSH private key used by 'ansible'."
  type = string
}

variable "ansible_config_file" {
  description = "File system path to the 'ansible' configuration file."
  type = string
}

variable "ansible_key_private" {
  description = "Private key used by 'ansible' for SSH access."
  type = string
}

variable "ansible_playbook_file" {
  description = "File system path to the 'ansible' playbook file."
  type = string
}
