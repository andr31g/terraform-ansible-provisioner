locals {
         working_dir = abspath(join(var.path_separator, [path.module, var.working_dir]))
   inputs_dir_public = join(var.path_separator, [path.module, var.inputs_dir_public])
  inputs_dir_private = join(var.path_separator, [path.module, var.inputs_dir_private])

  dns_records = {
    the_vm = {
      dns_name = var.vm_name
      dns_node = var.dns_tld
      ipv4_address = aws_instance.this.public_ip
    }
  }
}
