#!/bin/bash
echo "=== DIAGNÓSTICO COMPLETO C7200 ==="
echo ""

echo "1. Escaneo de puertos:"
nmap -p 22,23 192.168.122.10

echo ""
echo "2. Prueba Telnet (si está habilitado):"
echo "quit" | timeout 3 telnet 192.168.122.10 23 2>&1 | head -5

echo ""
echo "3. Prueba SSH con diferentes timeouts:"
for t in 1 2 3 5; do
    echo -n "  Timeout ${t}s: "
    timeout $t ssh -o ConnectTimeout=$t \
        -o BatchMode=yes \
        admin@192.168.122.10 exit 2>&1 | \
        grep -E "denied|timeout|refused|closed" | head -1 || \
        echo " Connection accepted?"
done

echo ""
echo "4. Prueba con contraseña incorrecta:"
timeout 3 sshpass -p 'WRONG' ssh -o StrictHostKeyChecking=no \
    admin@192.168.122.10 exit 2>&1 | grep -i "denied\|fail"

echo ""
echo "5. Captura de tráfico SSH (primeros paquetes):"
echo "Ejecutando tcpdump (Ctrl+C después de 3 segundos)..."
timeout 3 sudo tcpdump -i any host 192.168.122.10 and port 22 -c 10 2>/dev/null || \
    echo "  No se pudo capturar tráfico"

echo ""
echo "=== FIN DIAGNÓSTICO ==="
