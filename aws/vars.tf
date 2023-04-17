                    variable path_separator { default = "/" }

                       variable working_dir { default = "../../working" }
                 variable inputs_dir_public { default = "../../inputs/public" }
                variable inputs_dir_private { default = "../../inputs/private" }
                variable outputs_dir_public { default = "../../outputs/public" }
               variable outputs_dir_private { default = "../../outputs/private" }

                variable "aws_auth_profile" { default = "default" }

                           variable vm_name { default = "focal-server0" }
                      variable "aws_region" { default = "us-east-1"  }
               variable "aws_instance_type" { default = "t2.micro" }
variable "aws_root_block_device_size_in_gb" { default = 8 }

                 variable "aws_private_net" { default = "10.0.0.0/16" }
              variable "aws_private_subnet" { default = "10.0.1.0/24" }
