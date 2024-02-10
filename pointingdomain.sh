#!/bin/bash
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
#pointing domain ke cloudflare
apt install jq curl -y
clear

echo -e ""
echo -e "${BLUE}┌──────────────────────────────────────────┐${NC}"
echo -e "${BLUE}│        AUTO SCRIPT BY ALAWI VPN          │${NC}"
echo -e "${BLUE}│   SCRIPT POINTING DOMAIN KE CLOUDFLARE   │${NC}"
echo -e "${BLUE}└──────────────────────────────────────────┘${NC}"
echo -e "1. Menggunakan domain sendiri"
echo -e "2. Menggunakan domain xxx.alawistore.my.id"
echo -e ""
read -p "Pilih salah satu antara 1-2 atau tekan manapun (Random) : " host
echo ""
if [[ $host == "1" ]]; then
echo -e "   \e[1;32mMasukkan domain kamu>>> $NC"
read -p "   Subdomain: " host1
echo "IP=" >> /var/lib/kyt/ipvps.conf
echo $host1 > /etc/xray/domain
echo $host1 > /root/domain
echo ""
elif [[ $host == "2" ]]; then
#install cf
wget https://raw.githubusercontent.com/AlawiStore24/repoindo/main/pointing.sh && chmod +x pointing.sh && ./pointing.sh
rm -f /root/pointing.sh
clear
