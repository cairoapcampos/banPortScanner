#!/bin/bash

#Interface Wan
interface=enp0s8

#Hora e data do bloqueio
logDate=$(date +%d/%m/%y-%H:%M:%S)

#Diretorio de script e arquivos
cd /root

#Filtra do log do Kernel os ips de Port Scanner
dmesg | grep "port scanner" | awk '{print $9}' | cut -d= -f 2 | sort -u > badIP.txt

#Escreve no arquivo regras em vigor
iptables -nvL > rules.txt

#Cada ip de Port Scanner  é  buscado nas regras em vigor.
#Se não for encontrado  ele é bloqueado, caso contrário
#ele já foi bloqueado antes e somente uma mensagem é escrita no log.
for i in `cat  badIP.txt`
do
   if ! grep -Fq "$i" rules.txt
   then
      echo "$i - [$logDate] - IP BLOQUEANDO!" | tee -a /root/blockedIPs.log
      iptables -A INPUT -s $i -i $interface -j DROP
   else
      echo "$i - [$logDate] - IP JA BLOQUEADO!" | tee -a /root/blockedIPs.log
   fi
done


