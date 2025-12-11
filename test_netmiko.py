#!/usr/bin/env python3
import sys
import os

# Añade el venv al path por si acaso
venv_path = "/root/gns3-ansible/networking-venv"
sys.path.insert(0, os.path.join(venv_path, "lib/python3.13/site-packages"))

try:
    from netmiko import ConnectHandler
    print("Netmiko importado correctamente")
except ImportError:
    print("ERROR: Netmiko no está instalado en el venv")
    print("Ejecuta: source networking-venv/bin/activate && pip install netmiko")
    sys.exit(1)

# Prueba Telnet (más probable que funcione)
device_telnet = {
    'device_type': 'cisco_ios_telnet',
    'host': '192.168.122.10',
    'username': 'admin',
    'password': 'cisco123',
    'secret': 'cisco123',
    'port': 23,
    'timeout': 30,
    'verbose': True,
}

# Prueba SSH también
device_ssh = {
    'device_type': 'cisco_ios',
    'host': '192.168.122.10',
    'username': 'admin',
    'password': 'cisco123',
    'secret': 'cisco123',
    'port': 22,
    'timeout': 30,
}

print("\n" + "="*60)
print("PROBANDO CONEXIÓN AL ROUTER C7200")
print("="*60)

for name, device in [("Telnet", device_telnet), ("SSH", device_ssh)]:
    print(f"\n► Probando {name}...")
    try:
        connection = ConnectHandler(**device)
        print(f"  ✓ Conexión {name} establecida")
        
        # Enable mode
        connection.enable()
        print("  ✓ Modo enable activado")
        
        # Comando simple
        output = connection.send_command("show clock", delay_factor=2)
        print(f"  ⏰ Hora del router: {output}")
        
        # Mostrar hostname
        prompt = connection.find_prompt()
        print(f"  🏷️  Hostname: {prompt}")
        
        connection.disconnect()
        print(f"  🔌 Desconectado")
        
    except Exception as e:
        print(f"  ✗ Error {name}: {type(e).__name__}: {e}")

print("\n" + "="*60)
print("PRUEBA COMPLETA")
print("="*60)
