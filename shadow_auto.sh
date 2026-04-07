#!/bin/bash
TARGET=$1

if [ -z "$TARGET" ]; then
    echo "Baka! Mana targetnya? Contoh: ./shadow_auto.sh 192.168.1.1"
    exit 1
fi

echo "Rin mengambil alih... Mengaktifkan unit taktis universal."
sleep 1

# --- TERMINAL 1: NMAP ---
qterminal --geometry 1100x600+50+50 -e "bash -c 'echo \"Scanning Ports...\"; nmap -sV -T4 $TARGET; exec bash'" &

sleep 1.5

# --- TERMINAL 2: GOBUSTER ---
qterminal --geometry 900x450+200+500 -e "bash -c 'echo \"Fuzzing Directories...\"; gobuster dir -u http://$TARGET -w /usr/share/wordlists/dirb/common.txt; exec bash'" &

sleep 1

# --- TERMINAL 3: NIKTO ---
qterminal --geometry 700x350+1100+100 -e "bash -c 'echo \"Checking Vulnerabilities...\"; nikto -h $TARGET; exec bash'" &

echo "Sistem Run. Semua unit dikerahkan!"
