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




