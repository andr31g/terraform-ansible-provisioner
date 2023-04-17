#cloud-config

hostname: ${hostname}
fqdn: ${fqdn}

manage_etc_hosts: true

ssh_pwauth: false
disable_root: true

users:
  - name: ansible
    lock_passwd: True
    ssh_authorized_keys:
      - ${ansible_key_public}
    shell: /bin/bash
    groups: wheel
    sudo: ALL=(ALL) NOPASSWD:ALL

growpart:
  mode: auto
  devices: ['/']

packages:
  - qemu-guest-agent
  - python3
  - tree

runcmd:
  - rm /etc/netplan/50-cloud-init.yaml
  - netplan generate
  - netplan apply
  - systemctl daemon-reload
  - systemctl enable qemu-guest-agent
  - systemctl start qemu-guest-agent
