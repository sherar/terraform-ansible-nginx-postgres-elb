#!/usr/bin/env bash
sudo apt-get update

sudo apt-get -y install software-properties-common postgresql-client  
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

echo "Configure Ansible playbook"

sudo mkdir -p /tmp/ansible-postgres/
cat <<CONFIG | sudo tee /tmp/ansible-postgres/main.yml
- name: "Postgres setup"
  hosts: localhost
  connection: local
  become: yes
  roles:
    - geerlingguy.postgresql
CONFIG

echo "Install Postgtres Role"
sudo ansible-galaxy install geerlingguy.postgresql

echo "Run Ansible Playbook"
sudo ansible-playbook /tmp/ansible-postgres/main.yml