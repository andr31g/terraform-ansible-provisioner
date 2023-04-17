#cloud-config

hostname: ${hostname}
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

packages:
  - python3
  - tree

runcmd:
  - rm /etc/netplan/50-cloud-init.yaml
