resource "libvirt_volume" "focal-server-img" {
    name = var.vm_disk.dst_img_file
    pool = var.vm_disk.pool_name
  format = var.vm_disk.file_format
  source = join(var.path_separator, [local.source_images_dir, var.vm_disk.src_img_file])
}
