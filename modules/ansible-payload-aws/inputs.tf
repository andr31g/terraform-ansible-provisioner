variable "vm_name" {
  type = string
}

variable "vm_public_ipv4" {
  description = "Routable IPv4 address assigned to this instance."
  type = string
}

variable "inputs_dir_public" {
  description = "Top-level directory for files of a public nature, such as e.g., SSH public keys."
  type = string
}

variable "inputs_dir_private" {
  description = "Top-level directory for files of a private nature, such as e.g., SSH private keys."
  type = string
}

variable "working_dir" {
  description = "General purpose top-level working directory for arbitary content used by modules."
  type = string
}
