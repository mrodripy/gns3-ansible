#!/bin/bash
cd ~/gns3-ansible
source networking-venv/bin/activate
echo "Entorno Ansible para GNS3 activado"
echo "Directorio: $(pwd)"
echo "Ansible version: $(ansible --version | head -1)"
