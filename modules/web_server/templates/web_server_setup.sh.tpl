#!/usr/bin/env bash
sudo apt-get update

sudo apt-get -y install git software-properties-common;
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

# Get and run Ansible playbooks
git clone https://github.com/sherar/terraform-ansible-nginx /tmp/terraform-ansible-nginx
sudo ansible-playbook /tmp/terraform-ansible-nginx/nginx.yml
sudo ansible-playbook /tmp/terraform-ansible-nginx/sync.yml
