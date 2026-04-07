#!/bin/bash
TARGET=$1

if [ -z "$TARGET" ]; then
    echo "Hmph, berikan targetnya dulu, Baka! Contoh: ./shadow_auto.sh 192.168.1.1"
    exit 1
fi

echo "Shadow-sama memulai operasi... Mengunci target: $TARGET"
sleep 1

# --- TERMINAL 1: NMAP (RECONNAISSANCE) ---
gnome-terminal --geometry=100x25+50+50 --title="RECON_UNIT" -- bash -c "echo 'Scanning Ports...'; nmap -sV -T4 $TARGET; exec bash"

sleep 1.5 # Jeda agar transisinya terlihat elegan

# --- TERMINAL 2: GOBUSTER (ENUMERATION) ---
gnome-terminal --geometry=90x20+200+450 --title="DIRECTORY_FUZZER" -- bash -c "echo 'Fuzzing Directories...'; gobuster dir -u http://$TARGET -w /usr/share/wordlists/dirb/common.txt; exec bash"

sleep 1

# --- TERMINAL 3: NIKTO (VULNERABILITY SCAN) ---
gnome-terminal --geometry=70x15+1200+100 --title="VULN_SCANNER" -- bash -c "echo 'Checking Vulnerabilities...'; nikto -h $TARGET; exec bash"

echo "Semua unit telah dikerahkan secara efisien."