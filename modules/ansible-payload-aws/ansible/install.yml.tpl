- hosts: ${ansible_host}
  become: yes
  become_user: root
  become_method: sudo

  tasks:
    - name: Create the /opt/csg_security_agent directory
      file:
        path: /opt/csg_security_agent
        state: directory

    - name: Copy the security agent installer to the VM
      copy:
        src: ${agent_program_file}
        dest: /opt/csg_security_agent/security_agent_installer.sh

    - name: Copy the security agent configuration file to the VM
      copy:
        src: ${agent_config_file}
        dest: /opt/csg_security_agent/security_agent_config.conf

    - name: Make the security agent script executable
      file:
        dest: /opt/csg_security_agent/security_agent_installer.sh
        mode: a+x

    - name: Install security agent
      shell: /opt/csg_security_agent/security_agent_installer.sh --config security_agent_config.conf --token ${unique_token}
