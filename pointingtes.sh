#!/bin/bash
#pilihlah salah satu server di bawah ini
#kumpulan domain
clear
bir="\e[46"
biru="\e[36m"
merah="\033[31m"
hijau="\e[92;1m"
NC='\e[0m'
echo -e ""
echo -e "$biru┌──────────────────────────────────────────┐$NC"
echo -e "$biru│      ${hijau} POINTING DOMAIN BY ALAWI VPN       $biru│$NC"
echo -e "$biru└──────────────────────────────────────────┘$NC"
echo -e "$biru┌──────────────────────────────────────────┐$NC"
echo -e "$biru│$NC [${biru}01$NC]$NC alawistore.my.id                    $NC$biru│$NC"
echo -e "$biru│$NC [${biru}02$NC]$NC alawistore.biz.id                   $NC$biru│$NC"
echo -e "$biru│$NC [${biru}03$NC]$NC sshserver.my.id                     $NC$biru│$NC"
echo -e "$biru│$NC [${biru}04$NC]$NC serverssh.biz.id                    $NC$biru│$NC"
echo -e "$biru│$NC [${biru}05$NC]$NC vpnssh.biz.id                       $NC$biru│$NC"
echo -e "$biru└──────────────────────────────────────────┘$NC"
echo -e ""
read -rp "pilih salah satu (1-5): " host
echo -e ""
#domain 1
if [ $host -eq 1 ]
then
  clear
DOMAIN1=alawistore.my.id
  echo -e ""
  echo -e "$biru┌──────────────────────────────────────────┐$NC"
  echo -e "$biru│      ${hijau} POINTING DOMAIN BY ALAWI VPN       $biru│$NC"
  echo -e "$biru└──────────────────────────────────────────┘$NC"
  echo -e "$biru------>$NC  ${hijau}xxx.${DOMAIN1}  $biru<------$NC"
  echo -e ""
  read -rp "masukkan subdomain kamu: " -e sub1
  read -rp "masukkan ip vps kamu   : " -e ip1

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
./pointingtes.sh
#domain 2
el
#domain 3
el
#domain 4
el
#domain 5
el
#domain 6
el
#domain 7
el
#domain 8
el
#domain 9
el
#domain 10
el
#domain 11
el
#domain 12
el
#domain 13
el
#domain 14
el
#domain 15
el
#domain 16
el
fi
