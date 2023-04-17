network:
  version: 2
  renderer: networkd
  ethernets:
    ${vm_interface}:
      addresses:
        - ${vm_ip_address}/${vm_ip_mask}
      nameservers:
        search: [${vm_dns_search}]
        addresses: [${vm_dns_server}]
      routes:
        - to: default
          via: ${vm_default_gateway}
