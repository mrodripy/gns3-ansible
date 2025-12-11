#!/bin/bash
echo "=== PRUEBAS SSH AL ROUTER ==="
echo "IP: 192.168.122.10"
echo "Usuario: admin"
echo ""

# 1. Prueba conexión básica
echo "1. Prueba telnet al puerto 22:"
nc -zv 192.168.122.10 22 && echo "Puerto 22 ABIERTO" || echo "Puerto 22 CERRADO"

echo ""
echo "2. Prueba SSH con diferentes métodos:"
echo ""

# 2. Prueba sin opciones
echo "a) SSH simple:"
timeout 3 ssh admin@192.168.122.10 echo "OK" 2>&1 | head -2

# 3. Prueba forzando password
echo ""
echo "b) SSH forzando password:"
timeout 3 ssh -o PreferredAuthentications=password \
             -o PubkeyAuthentication=no \
             admin@192.168.122.10 echo "OK" 2>&1 | head -2

# 4. Prueba con verbose
echo ""
echo "c) SSH verbose (primeras líneas):"
timeout 3 ssh -v -o PreferredAuthentications=password \
             admin@192.168.122.10 exit 2>&1 | grep -i "auth\|pass\|deni\|fail" | head -5

# 5. Ver si hay claves SSH interferiendo
echo ""
echo "3. Verificando claves SSH locales:"
ls -la ~/.ssh/ 2>/dev/null || echo "No hay directorio .ssh"

echo ""
echo "=== FIN PRUEBAS ==="
