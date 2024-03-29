#!/bin/bash

#warna-warna
biru="\033[36m"
hijau="\e[92;1m"
red='\e[1;31m'
NC='\e[0m'

#list domain
echo -e ""
echo -e "${biru}┌──────────────────────────────────────────┐${NC}"
echo -e "${biru}│${NC}       ${hijau}POINTING DOMAIN BY ALAWI VPN       ${biru}│${NC}"
echo -e "${biru}└──────────────────────────────────────────${biru}┘${NC}"
echo -e "${biru}┌──────────────────────────────────────────${biru}┐${NC}"
echo -e "${biru}│${NC} [${biru}01${NC}] domain xxx.alawistore.my.id         ${biru}│${NC}"
echo -e "${biru}│${NC} [${biru}02${NC}] domain xxx.alawistore.biz.id        ${biru}│${NC}"
echo -e "${biru}│${NC} [${biru}03${NC}] domain xxx.alawivpn.cloud           ${biru}│${NC}"
echo -e "${biru}│${NC} [${biru}04${NC}] domain xxx.cakdayat.my.id           ${biru}│${NC}"
echo -e "${biru}│${NC} [${biru}05${NC}] domain xxx.petapan.my.id            ${biru}│${NC}"
echo -e "${biru}│${NC} [${biru}06${NC}] domain xxx.sayasantri.my.id         ${biru}│${NC}"
echo -e "${biru}│${NC} [${biru}07${NC}] domain xxx.serverssh.biz.id         ${biru}│${NC}"
echo -e "${biru}│${NC} [${biru}08${NC}] domain xxx.sshserver.my.id          ${biru}│${NC}"
echo -e "${biru}│${NC} [${biru}09${NC}] domain xxx.udpserver.my.id          ${biru}│${NC}"
echo -e "${biru}│${NC} [${biru}10${NC}] domain xxx.vmesserver.my.id         ${biru}│${NC}"
echo -e "${biru}│${NC} [${biru}11${NC}] domain xxx.vpnbagus.my.id           ${biru}│${NC}"
echo -e "${biru}│${NC} [${biru}12${NC}] domain xxx.vpnssh.biz.id            ${biru}│${NC}"
echo -e "${biru}│${NC} [${biru}13${NC}] domain xxx.vpssantri.my.id          ${biru}│${NC}"
echo -e "${biru}│${NC} [${biru}14${NC}] domain xxx.vpsvpn.my.id             ${biru}│${NC}"
echo -e "${biru}│${NC} [${biru}15${NC}] domain xxx.wush.my.id               ${biru}│${NC}"
echo -e "${biru}│${NC} [${biru}16${NC}] domain xxx.wussh.my.id              ${biru}│${NC}"
echo -e "${biru}└──────────────────────────────────────────${biru}┘${NC}"
echo -e ""
read -rp "$( echo -e "${red}Pilih salah satu dari 1 sampai 16 :${NC}") " host
#domain 1
if [ $host -eq 1 ]
then
  clear
DOMAIN1=alawistore.my.id
echo -e ""
echo -e "${biru}┌──────────────────────────────────────────┐${NC}"
echo -e "${biru}│${NC}       ${hijau}POINTING DOMAIN BY ALAWI VPN       ${biru}│${NC}"
echo -e "${biru}└──────────────────────────────────────────${biru}┘${NC}"
echo -e ""
echo -e "${biru}------>     ${hijau}xxx.alawistore.my.id     ${biru}<------${NC}"
echo -e ""
read -rp "$( echo -e "${red}masukkan subdomain kamu :${NC}") " sub1
read -rp "$( echo -e "${red}masukkan ip vps kamu    :${NC}") " ip1

SUB_DOMAIN1=${sub1}.${DOMAIN1}
SUB_DOMAIN01=zoomcares.zoom.us.${sub1}.${DOMAIN1}
CF_ID=vpsvpsku@gmail.com
CF_KEY=cb9b858e75a955df979cf4bff74839df1943d

set -euo pipefail
IP1=${ip1};
hijau="\e[92;1m"
echo -e ""
echo -e "Sedang pointing ${biru}${SUB_DOMAIN1}$NC..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN1}&status=active" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN1}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
if [[ "${#RECORD}" -le 10 ]]; then
RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"A","name":"'${SUB_DOMAIN1}'","content":"'${IP1}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi
RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"A","name":"'${SUB_DOMAIN1}'","content":"'${IP1}'","ttl":120,"proxied":false}')
echo -e "${hijau}Sukses!$NC"
#zoomcares.zoom.us
echo -e "Sedang pointing ${biru}${SUB_DOMAIN01}$NC..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN1}&status=active" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN01}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" | jq -r .result[0].id)
if [[ "${#RECORD}" -le 10 ]]; then
RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"A","name":"'${SUB_DOMAIN01}'","content":"'${IP1}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi
RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
-H "X-Auth-Email: ${CF_ID}" \
-H "X-Auth-Key: ${CF_KEY}" \
-H "Content-Type: application/json" \
--data '{"type":"A","name":"'${SUB_DOMAIN01}'","content":"'${IP1}'","ttl":120,"proxied":false}')
echo -e "${hijau}Sukses!$NC"
echo -e ""
sleep 3
clear
#pemberitahuan selesai
echo -e ""
echo -e "$biru┌──────────────────────────────────────────┐$NC"
echo -e "$biru│   ${hijau}POINTING DOMAIN KE CLOUDFLARE SELESAI  $biru│$NC"
echo -e "$biru└──────────────────────────────────────────┘$NC"
echo -e ""
echo -e "${hijau}Berhasil$NC Pointing ${biru}${SUB_DOMAIN1}$NC"
echo -e "         Untuk ip ${biru}${IP1}$NC"
echo -e ""
read -rp "$( echo -e "Tekan [ ${biru}enter$NC ] untuk kembali... ") "
echo ""
pointing
#jika sembarangan maka
elif [ $host -eq * ]
then
  clear
  ./tesdomain.sh
