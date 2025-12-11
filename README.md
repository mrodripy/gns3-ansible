# Ansible Automation for Cisco C7200 in GNS3

![Ansible](https://img.shields.io/badge/Ansible-2.20.1-red)
![Cisco IOS](https://img.shields.io/badge/Cisco%20IOS-15.2-blue)
![GNS3](https://img.shields.io/badge/GNS3-2.2-green)
![GitHub last commit](https://img.shields.io/bithub/last-commit/mrodripy/gns3-ansible)
![GitHub stars](https://img.shields.io/github/stars/mrodripy/gns3-ansible)

Automation framework for managing Cisco C7200 routers in GNS3 lab environment using Ansible.

## 🚀 Features
- ✅ Backup and restore router configurations
- ✅ Automated deployment of baseline configurations
- ✅ OSPF routing configuration
- ✅ Security policy enforcement
- ✅ Multi-device inventory management

## 📁 Project Structure

gns3-ansible/
├── ansible.cfg
├── inventory/
│ └── example.yml
├── playbooks/
│ ├── backup_config.yml
│ ├── deploy_baseline.yml
│ └── configure_ospf.yml
├── requirements.txt
├── requirements.yml
├── setup.sh
├── .gitignore
└── README.md



## ⚡ Quick Start
```bash
# Clone repository
git clone https://github.com/mrodripy/gns3-ansible.git
cd gns3-ansible

# Setup environment
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
ansible-galaxy collection install -r requirements.yml

# Test connection
ansible-playbook playbooks/test_connection.yml

📝 License

MIT License - See LICENSE file for details.

Project created for network automation learning with GNS3 and Ansible
