#!/bin/bash
TARGET=$1

if [ -z "$TARGET" ]; then
    echo "Baka! Mana targetnya? Contoh: ./shadow_auto.sh 192.168.1.1"
    exit 1
fi

echo "Rin mengambil alih... Mengaktifkan unit taktis universal."
sleep 1

# --- TERMINAL 1: NMAP ---
x-terminal-emulator --geometry 100x25+50+50 -e bash -c "nmap -sV -T4 $TARGET; exec bash" &

sleep 1.5

# --- TERMINAL 2: GOBUSTER ---
x-terminal-emulator --geometry 90x20+200+450 -e bash -c "gobuster dir -u http://$TARGET -w /usr/share/wordlists/dirb/common.txt; exec bash" &

sleep 1

# --- TERMINAL 3: NIKTO ---
x-terminal-emulator --geometry 70x15+1200+100 -e bash -c "nikto -h $TARGET; exec bash" &

echo "Sistem Run. Semua unit dikerahkan!"
