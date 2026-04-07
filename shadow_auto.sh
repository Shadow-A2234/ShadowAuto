#!/bin/bash
TARGET=$1

if [ -z "$TARGET" ]; then
    echo "Target nya? Contoh: ./shadow_auto.sh 192.168.1.1"
    exit 1
fi

echo "Rin mengambil alih... Mengaktifkan unit di XFCE."
sleep 1

# --- TERMINAL 1: NMAP (Kiri Atas) ---
xfce4-terminal --geometry=100x25+50+50 --title="RECON_UNIT" -e "bash -c 'echo \"Scanning Ports...\"; nmap -sV -T4 $TARGET; exec bash'" &

sleep 1.5

# --- TERMINAL 2: GOBUSTER (Tengah-Bawah) ---
xfce4-terminal --geometry=90x20+200+450 --title="DIRECTORY_FUZZER" -e "bash -c 'echo \"Fuzzing Directories...\"; gobuster dir -u http://$TARGET -w /usr/share/wordlists/dirb/common.txt; exec bash'" &

sleep 1

# --- TERMINAL 3: NIKTO (Kanan Atas) ---
xfce4-terminal --geometry=70x15+1200+100 --title="VULN_SCANNER" -e "bash -c 'echo \"Checking Vulnerabilities...\"; nikto -h $TARGET; exec bash'" &

echo "System Run"
