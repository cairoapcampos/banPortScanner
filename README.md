# banPortScanner
Conjuto de scripts para banir IPs usados por Port Scanners

## Instruções

1. Clonar repositório

```
git clone https://github.com/cairoapcampos/banPortScanner.git
cd banPortScanner
```

2. Mover scripts

```
mv banPortScanner.sh /root
mv firewall /etc/init.d/
mv firewall.service /lib/systemd/system
cd ..
rm -R banPortScanner
```

3. Definir permissão de execução para o script principal:

```
chmod 700 /root/banPortScanner.sh
chmod 700  /etc/init.d/firewall
```

4. Alterar interface nas configurações

Deve-se trocar o nome da interface wan monitorada na variavél interface `interface=enp0s8` nos arquivos abaixo:

```
nano /root/banPortScanner.sh
nano /etc/init.d/firewall
```

4. Agendamento de script no crontab como root:

`crontab -e`

Inserir a Linha:

`00 * * * * root sh /root/banPortScanner.sh`


4. Comandos para gerência:

```
/etc/init.d/firewall start 
/etc/init.d/firewall status
/etc/init.d/firewall stop
/etc/init.d/firewall restart 

systemctl start firewall
systemctl stop firewall
systemctl restart firewall
systemctl status firewall
```

## Testes realizados
```
Máquia 1 - Servidor Web (Interface Wan monitorada: enp0s8 - IP: 192.168.0.3)
Máquina 2 - Cliente Kali Linux (IP: 192.168.0.10)
```

Foi configuradas duas máquinas na mesma rede para um teste inicial. Usando o comando abaixo na máquina Kali tentamos 
obeter informações do servidor web.

`nmap -A -sS 192.168.0.3`

O comando rodará até ser concluído. Posteriormente de acordo com o agendamento no crontab o ip será bloqueado. Caso o mesmo comando
sejá executado novamente com o mesmo IP de origem, o mesmo não será finalizado com poucas informações capturadas.

## Fontes

```
https://www.vivaolinux.com.br/dica/Bloqueando-PortScanners-com-IPTABLES
https://www.vivaolinux.com.br/dica/Utilizando-o-nmap-para-descobrir-versao-dos-servicos
https://blog.remontti.com.br/2435
https://blog.remontti.com.br/2478
```




