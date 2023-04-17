locals {
  working_dir = abspath(join(var.path_separator, [path.module, var.working_dir]))
  source_images_dir = join(var.path_separator, [path.module, var.source_images_dir])
  inputs_dir_public = join(var.path_separator, [path.module, var.inputs_dir_public])
  inputs_dir_private = join(var.path_separator, [path.module, var.inputs_dir_private])
}
