#!/bin/bash
TARGET=$1

if [ -z "$TARGET" ]; then
    echo "Baka! Mana targetnya? Contoh: ./shadow_auto.sh 192.168.1.1"
    exit 1
fi

echo "Rin mengambil alih... Mengaktifkan unit taktis universal."
sleep 1

# --- TERMINAL 1: NMAP ---
xfce4-terminal --geometry=130x35+50+50 --title="RECON_UNIT" -e "bash -c 'echo \"Scanning Ports...\"; nmap -sV -T4 $TARGET; exec bash'" &

sleep 1.5

# --- TERMINAL 2: GOBUSTER ---
xfce4-terminal --geometry=110x25+300+500 --title="DIRECTORY_FUZZER" -e "bash -c 'echo \"Fuzzing Directories...\"; gobuster dir -u http://$TARGET -w /usr/share/wordlists/dirb/common.txt; exec bash'" &

sleep 1

# --- TERMINAL 3: NIKTO ---
xfce4-terminal --geometry=80x20+1100+100 --title="VULN_SCANNER" -e "bash -c 'echo \"Checking Vulnerabilities...\"; nikto -h $TARGET; exec bash'" &

echo "Sistem Run. Semua unit dikerahkan!"
