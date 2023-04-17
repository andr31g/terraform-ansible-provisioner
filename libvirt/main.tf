resource "libvirt_domain" "this" {
   cloudinit = libvirt_cloudinit_disk.this.id
  qemu_agent = true

        name = var.vm_name
        vcpu = var.vm_vcpu
      memory = var.vm_ram

  disk {
    volume_id = libvirt_volume.focal-server-img.id
  }

  network_interface {
      network_name = var.vm_libvirt_network_name
    wait_for_lease = true
  }

  console {
    target_port = "0"
    target_type = "serial"
           type = "pty"
  }

  console {
    target_port = "1"
    target_type = "virtio"
           type = "pty"
  }

  graphics {
    listen_type = "address"
       autoport = "true"
           type = "spice"
  }
}

resource "libvirt_cloudinit_disk" "this" {
            name = var.cloud_init_iso
            pool = libvirt_volume.focal-server-img.pool
       user_data = module.ansible-payload-libvirt.cloud_init_template_reified
  network_config = module.ansible-payload-libvirt.netplan_template_reified
}
