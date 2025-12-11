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
```
gns3-ansible/
├── LICENSE
├── README.md
├── CONTRIBUTING.md
├── ansible.cfg
├── requirements.txt
├── requirements.yml
├── setup.sh
├── start_ansible.sh
├── .gitignore
├── inventory/
│ ├── c7200.yml # Router-specific configuration
│ ├── hosts.yml # Main example inventory (no credentials)
│ └── telnet_hosts.yml # Telnet configuration example
└── playbooks/
├── test_connection.yml # Test basic connectivity
├── backup_config.yml # Backup router configuration
├── manage_router.yml # Basic router management
└── simple_backup.yml # Simple backup example
```
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

# Test connection using example inventory
ansible-playbook playbooks/test_connection.yml -i inventory/hosts.yml

# Backup configuration
ansible-playbook playbooks/backup_config.yml -i inventory/hosts.yml

# Basic management
ansible-playbook playbooks/manage_router.yml -i inventory/hosts.yml

📝 License

MIT License - See LICENSE file for details.

Project created for network automation learning with GNS3 and Ansible
