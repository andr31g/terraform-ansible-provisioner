resource "null_resource" "this" {
  #
  # Trigger provisioners to be re-executed every time the instance 'id' changes.
  #
  triggers = {
    id = var.vm_instance_id
  }

  #
  # Before the 'local-exec' section can succesfully be executed,
  # we need to ensure that the 'VM' is up and running. Therefore,
  # we use the 'remote-exec' facility to connect to the 'VM' to
  # ensure that it is in fact in the state in which we can connect
  # to it, before we use the 'local-exec' facility to run 'ansible'.
  #
  provisioner "remote-exec" {
    inline = [
      "echo 'Connected'"
    ]
    connection {
          timeout = "3m"
             type = "ssh"
             user = var.ansible_username
             host = var.vm_public_ipv4
      private_key = file(var.ansible_key_private)
    }
  }
  
  #
  # There are other ways that 'ansible' can be executed after 'terraform'
  # is finished. We can e.g., read the resulting state files that 'terraform'
  # creates, and parse them to extract the necessary information, which
  # we can then feed to 'ansible' externally. Here, we instead choose to
  # simply use the 'local-exec' facility, to execute 'ansible' directly.
  #
  provisioner "local-exec" {
    command = <<EOF
      printf "The provisioned VM is at the following IP: ${var.vm_public_ipv4}\n"
      ANSIBLE_CONFIG=${var.ansible_config_file} ansible-playbook -u ${var.ansible_username} --private-key ${var.ansible_key_private} -i ${var.vm_public_ipv4}, ${var.ansible_playbook_file}
      EOF
  }
}
