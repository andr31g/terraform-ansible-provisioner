# About

This project aims to make it easier to use `terraform` and `ansible` to provision VMs on
different cloud vendors. Initial release has support for `aws` and `libvirt` providers.

General idea is to keep the version control repo clean. In other words, not only do we not
want sensitive credentials to wind up in a `git` repo, but we also want to avoid the `git`
working tree from being polluted by various runtime artifacts of `terraform` and `ansible`.

Below, is an overview of the directory structure used by this project. All version-controlled
resources are stored in the directory named `deploy`. At the same level in the filesystem
tree, there are also the following directories: `images`, `inputs`, `outputs` and `working`.

```
├── deploy
├── images
├── inputs
│   ├── private
│   │   ├── agent
│   │   │   └── token.txt
│   │   ├── ssh
│   │   │   ├── ansible.priv
│   │   └── terraform
│   │       └── aws-dns.tfvars
│   └── public
│       └── ssh
│           └── ansible.pub
├── outputs
│   ├── private
│   └── public
└── working
    └── ansible
```

The directory named `inputs` contains files that are required as inputs during the runtime of the
`terraform` and `ansible` scripts. This directory is further subdivided into `private` and `public`
sub-directories, wherein the former could e.g., be used to store SSH private keys, while the latter,
as the name implies, is used to store credentials that are not sensitive, such as e.g., SSH public
keys. The naming is designed to warn the user of this concept, i.e., of strict separation between
public and private resources, however, presently no automated means of enforcement are implemented.

The `outputs` directory mirrors the structure of the `inputs` directory with respect to security
concerns, but its primary purpose is to serve as a store of artifacts produced by the scripts
during runtime.

The directory named `images` contains local virtual machine images for deployment with the `libvirt`
provider for `terraform`.

Lastly, the `working` directory is a general-purpose working directory for the scripts. For example,
when template files are instantiated, their reified versions are stored in the `working` directory.

# To run the `aws` provisioner:

1) Ensure the existence of valid AWS credentials in `~/.aws/credentials`
   (see `deploy/docs/aws-credentials-howto.txt` for more information)

2) Create an SSH key pair
3) Ensure the private key can be found at this location: `inputs/private/ssh/ansible.priv`
4) Ensure the public key can be found at this location: `inputs/public/ssh/ansible.pub`

5) `cd` to the directory `deploy/aws` in the checked-out working tree

6) If you intend to create a DNS record for the newly-launched VM, issue the following:

   `$ terraform apply -var aws_dns_apply_records=true --var-file=../../inputs/private/terraform/aws-dns.tfvars -auto-approve`

   Else, if you do not want to create a DNS record, issue the following instead:
   
   `$ terraform apply -auto-approve`

   The first option ensures that the module `aws-dns` also executes, ensuring the creation
   of the DNS record. In the case of the second option, we're expressly choosing not to do
   any DNS modifications, because if the variable `aws_dns_apply_records` is `false`, which
   it is by default, then the module `aws-dns` will not execute.
   

To reverse the process, i.e., to destroy all the managed resources, issue:

`$ terraform destroy --var-file=../../inputs/private/terraform/aws-dns.tfvars`

or, if DNS was not used at the time of `apply`, simply issue:

`$ terraform destroy`


To verify SSH access:

```
$ cd inputs/private/ssh
$ ssh -o StrictHostKeyChecking=no -i ansible.priv ansible@<VM_PUBLIC_IP>
```
