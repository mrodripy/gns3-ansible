#!/bin/bash
# GNS3 Ansible Setup Script

echo "🚀 Setting up GNS3 Ansible Automation Environment"
echo "================================================"

# Check for Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 is not installed. Please install Python 3.8+ first."
    exit 1
fi

# Create virtual environment
echo "1. Creating Python virtual environment..."
python3 -m venv venv || {
    echo "❌ Failed to create virtual environment"
    exit 1
}

# Activate environment
source venv/bin/activate

# Install Python dependencies
echo "2. Installing Python dependencies..."
pip install --upgrade pip
pip install -r requirements.txt || {
    echo "❌ Failed to install Python dependencies"
    exit 1
}

# Install Ansible collections
echo "3. Installing Ansible collections..."
ansible-galaxy collection install -r requirements.yml || {
    echo "⚠️  Some collections failed to install, but continuing..."
}

# Create example production inventory if it doesn't exist
echo "4. Setting up inventory..."
if [ ! -f "inventory/production.yml" ]; then
    mkdir -p inventory/production
    echo "⚠️  Note: Create 'inventory/production.yml' with your actual credentials"
fi

echo ""
echo "✅ Setup completed successfully!"
echo ""
echo "Next steps:"
echo "1. Create 'inventory/production.yml' with your device credentials"
echo "2. Activate environment: source venv/bin/activate"
echo "3. Test: ansible-playbook playbooks/test_connection.yml -i inventory/hosts.yml"
echo ""
echo "For more help, see README.md"
