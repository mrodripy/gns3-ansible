# Ansible Automation for Cisco C7200 in GNS3

![Ansible](https://img.shields.io/badge/Ansible-2.20.1-red)
![Cisco IOS](https://img.shields.io/badge/Cisco%20IOS-15.2-blue)
![GNS3](https://img.shields.io/badge/GNS3-2.2-green)
![GitHub last commit](https://img.shields.io/github/last-commit/TU_USUARIO/gns3-ansible)
![GitHub stars](https://img.shields.io/github/stars/TU_USUARIO/gns3-ansible)

Automation framework for managing Cisco C7200 routers in GNS3 lab environment using Ansible. Perfect for network automation learning, lab testing, and CI/CD pipeline development.

## 📑 Table of Contents
- [Features](#-features)
- [Project Structure](#-project-structure)
- [Quick Start](#-quick-start)
- [Installation](#-installation)
- [Usage](#-usage)
- [Playbooks](#-playbooks)
- [Security](#-security)
- [Troubleshooting](#-troubleshooting)
- [Contributing](#-contributing)
- [License](#-license)

## 🚀 Features

- ✅ **Backup and Restore**: Automated configuration backups and versioning
- ✅ **Baseline Deployment**: Consistent configuration across all devices
- ✅ **Routing Protocols**: OSPF, EIGRP, BGP configuration templates
- ✅ **Security Hardening**: ACLs, AAA, SSH hardening policies
- ✅ **Health Monitoring**: Automated health checks and reporting
- ✅ **Multi-device Management**: Scale from 1 to 100+ devices
- ✅ **GNS3 Integration**: Optimized for virtual lab environments
- ✅ **Idempotent Operations**: Safe, repeatable configuration changes

## 📁 Project Structure

gns3-ansible/
├── ansible.cfg # Ansible configuration
├── inventory/ # Device inventory
│ ├── example.yml # Example inventory (no secrets)
│ └── production/ # Production inventory (gitignored)
├── playbooks/ # Ansible playbooks
│ ├── backup_config.yml # Configuration backup
│ ├── deploy_baseline.yml # Baseline configuration
│ ├── configure_ospf.yml # OSPF configuration
│ ├── security_hardening.yml # Security policies
│ └── monitor_health.yml # Health monitoring
├── roles/ # Reusable roles
│ └── router_basics/ # Basic router configuration
├── group_vars/ # Group variables
├── host_vars/ # Host variables (gitignored)
├── templates/ # Jinja2 templates
├── backups/ # Configuration backups (gitignored)
├── requirements.txt # Python dependencies
├── requirements.yml # Ansible collections
├── setup.sh # Setup script
├── .gitignore # Git ignore rules
└── README.md # This file
text


## ⚡ Quick Start

### Prerequisites:
- Python 3.8+
- GNS3 2.2+
- Cisco C7200 IOS image (15.2 or higher)

### One-line setup:
```bash
git clone https://github.com/TU_USUARIO/gns3-ansible.git && cd gns3-ansible && ./setup.sh

Verify connection:
bash

# Test connection to your C7200 router
ansible-playbook playbooks/test_connection.yml -i inventory/production.yml

🛠️ Installation
Method 1: Automated Setup (Recommended)
bash

# Clone the repository
git clone https://github.com/TU_USUARIO/gns3-ansible.git
cd gns3-ansible

# Run automated setup script
chmod +x setup.sh
./setup.sh

Method 2: Manual Setup
bash

# 1. Create and activate virtual environment
python3 -m venv networking-venv
source networking-venv/bin/activate

# 2. Install Python dependencies
pip install --upgrade pip
pip install -r requirements.txt

# 3. Install Ansible collections
ansible-galaxy collection install -r requirements.yml

# 4. Configure your environment
mkdir -p inventory/production
cp inventory/example.yml inventory/production/production.yml
# Edit with your actual credentials
nano inventory/production/production.yml

GNS3 Router Configuration:

    Import C7200 router in GNS3

    Configure FastEthernet0/0 with IP: 192.168.122.10/24

    Enable SSH:

cisco

configure terminal
hostname C7200
ip domain-name lab.local
crypto key generate rsa modulus 1024
username admin privilege 15 secret cisco
line vty 0 4
 transport input ssh
 login local
end
write memory

📋 Usage
Basic Operations:
bash

# Backup all router configurations
ansible-playbook playbooks/backup_config.yml -i inventory/production.yml

# Deploy baseline configuration
ansible-playbook playbooks/deploy_baseline.yml -i inventory/production.yml

# Configure OSPF routing
ansible-playbook playbooks/configure_ospf.yml -i inventory/production.yml

# Apply security hardening
ansible-playbook playbooks/security_hardening.yml -i inventory/production.yml

Device Information:
bash

# Get detailed router facts
ansible routers -m cisco.ios.ios_facts -i inventory/production.yml

# Show interface status
ansible routers -m cisco.ios.ios_command \
  -a "commands='show ip interface brief'" \
  -i inventory/production.yml

# Check routing table
ansible routers -m cisco.ios.ios_command \
  -a "commands='show ip route'" \
  -i inventory/production.yml

Running Specific Tasks:
bash

# Use tags to run specific parts
ansible-playbook playbooks/deploy_baseline.yml --tags="backup,ntp"
ansible-playbook playbooks/deploy_baseline.yml --tags="security" --skip-tags="acl"

🎯 Playbooks
Playbook	Description	Tags
backup_config.yml	Backup running/startup configs	backup
deploy_baseline.yml	Baseline config (NTP, logging, banners)	baseline
configure_ospf.yml	OSPF routing configuration	routing, ospf
security_hardening.yml	Security policies (ACLs, SSH, AAA)	security
monitor_health.yml	Health checks and reporting	monitoring
upgrade_ios.yml	IOS image upgrade workflow	upgrade
Example: Custom Configuration
yaml

# Customize in group_vars/all.yml
router_settings:
  hostname: "LAB-ROUTER"
  domain_name: "lab.local"
  ntp_servers:
    - "192.168.122.1"
  syslog_server: "192.168.122.1"

🔐 Security
Best Practices:

    Never commit secrets to Git - Use ansible-vault for encryption

    Use environment variables for sensitive data

    Keep production inventory separate (already gitignored)

    Regularly rotate credentials

Using Ansible Vault:
bash

# Create encrypted vault file
ansible-vault create inventory/production/vault.yml

# Edit encrypted file
ansible-vault edit inventory/production/vault.yml

# Run playbook with vault
ansible-playbook playbooks/deploy_baseline.yml \
  -i inventory/production/production.yml \
  --ask-vault-pass

Sample vault.yml:
yaml

---
vault_username: "admin"
vault_password: "cisco123"
vault_enable_password: "cisco123"

🐛 Troubleshooting
Common Issues:
Issue	Solution
SSH Connection Failed	Check SSH service: show ip ssh
Permission Denied	Verify username has privilege 15
Timeout Errors	Increase timeout in ansible.cfg
IOS Compatibility	Add SSH args for old IOS versions
GNS3 Network Issues	Verify host-only adapter settings
Debug Commands:
bash

# Test SSH manually
ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 admin@192.168.122.10

# Verbose output
ansible-playbook playbooks/test.yml -vvvv

# Check specific task
ansible routers -m ping -vvv

GNS3-Specific Tips:

    Ensure GNS3 VM has network connectivity to host

    Use "NAT" or "Host-only" adapter for management network

    Allow ICMP and SSH in host firewall

    Verify IP addressing in GNS3 topology

🤝 Contributing

We welcome contributions! Here's how:

    Fork the repository

    Create a feature branch: git checkout -b feature/amazing-feature

    Commit your changes: git commit -m 'Add amazing feature'

    Push to the branch: git push origin feature/amazing-feature

    Open a Pull Request

Contribution Guidelines:

    Follow Ansible best practices

    Add tests for new playbooks

    Update documentation

    Use meaningful commit messages

📝 License

This project is licensed under the MIT License - see the LICENSE file for details.
🙏 Acknowledgments

    Cisco Systems for IOS and networking technology

    GNS3 Team for the incredible network simulator

    Ansible Community for network automation modules

    All contributors who help improve this project

📞 Support

    Issues: GitHub Issues

    Discussions: GitHub Discussions

    Email: mrodriguex@yahoo.com

⭐ If you find this project useful, please give it a star on GitHub!
