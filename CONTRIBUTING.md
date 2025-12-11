# Contributing to GNS3 Ansible Automation

First off, thank you for considering contributing to this project! This project is designed to help network engineers learn and automate Cisco routers in GNS3 environments.

## 🎯 How Can I Contribute?

### 🐛 Reporting Bugs
If you find a bug, please:
1. **Check existing issues** to avoid duplicates
2. **Include details**:
   - GNS3 version
   - Cisco IOS image version
   - Ansible version
   - Full error message
3. **Describe steps** to reproduce the issue
4. **Add screenshots** if relevant

### 💡 Suggesting Enhancements
Have an idea to improve this project?
1. **Check open suggestions** first
2. **Explain the use case** clearly
3. **Consider if it fits** the project scope (GNS3 + Ansible + Cisco)
4. **Provide examples** if possible

### 🔧 Pull Requests
Want to add code or fix something?
1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Follow Ansible best practices**:
   - Use proper YAML formatting
   - Make playbooks idempotent
   - Add comments for complex logic
4. **Update documentation** if needed
5. **Test your changes** in a GNS3 environment
6. **Submit the pull request**

## 📝 Code Guidelines

### Playbook Standards
- Use `ansible-lint` for YAML validation
- Include `name:` for all tasks
- Use meaningful variable names
- Add tags for task grouping
- Ensure idempotency (run playbook twice = no changes)

### Inventory Structure
- Never commit real credentials
- Use environment variables for sensitive data
- Follow the example in `inventory/hosts.yml`
- Document any non-standard configurations

### Security Practices
- **NEVER** commit passwords, keys, or sensitive data
- Use `ansible-vault` for encrypted variables
- Test in isolated GNS3 labs before production
- Validate SSH/Telnet configurations

## 🧪 Testing

Before submitting:
1. **Test in GNS3** with Cisco C7200 or similar
2. **Verify idempotency**: Run playbook twice
3. **Check rollback** functionality if applicable
4. **Test with different** IOS versions if possible

## ❓ Questions?

- **Open a Discussion**: For general questions
- **Create an Issue**: For bugs or feature requests
- **Check README.md**: For setup and usage instructions

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License (see LICENSE file).

---

*Happy automating! 🚀*
