                    variable path_separator { default = "/" }
                    variable fqdn_separator { default = "." }

                    variable cloud_init_iso { default = "cloudinit-focal-server0.iso" }

                       variable working_dir { default = "../../working" }
                 variable source_images_dir { default = "../../images" }
                 variable inputs_dir_public { default = "../../inputs/public" }
                variable inputs_dir_private { default = "../../inputs/private" }
                variable outputs_dir_public { default = "../../outputs/public" }
               variable outputs_dir_private { default = "../../outputs/private" }

                           variable vm_name { default = "focal-server0" }
                            variable vm_ram { default = 2048 }
                           variable vm_vcpu { default = 2 }

           variable vm_libvirt_network_name { default = "default" }
                            variable vm_nic { default = "ens3" }

                     variable vm_ip_address { default = "192.168.122.20" }
                        variable vm_ip_mask { default = "24" }
                variable vm_default_gateway { default = "192.168.122.1" }

                     variable vm_dns_domain { default = "testdomain" }
                     variable vm_dns_server { default = "1.1.1.1" }
                     variable vm_dns_search { default = "testdomain" }

                           variable vm_disk {
                             type = map(string)
                                  default = {
                                         src_img_file = "focal-server-cloudimg-amd64-disk-kvm-resized.img"
                                          file_format = "qcow2"
                                         dst_img_file = "focal-server-img.qcow2"
                                            pool_name = "default"
                                  }
                           }
