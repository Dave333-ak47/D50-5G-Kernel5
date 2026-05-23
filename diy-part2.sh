#!/bin/bash
# Rimuove eventuali pacchetti duplicati
rm -rf package/luci-app-exigod50

# Clona la tua app per la gestione del modem 5G
git clone https://github.com/Dave333-ak47/d50-modem-feed package/luci-app-exigod50

# Crea la cartella dei firmware nel sistema OpenWrt
mkdir -p package/base-files/files/lib/firmware/

# Copia i dati radio di calibrazione Bdwlan (cerca file e cartelle nella root)
echo "Iniezione dati di calibrazione Wi-Fi in corso..."
cp -r Bdwlan* package/base-files/files/lib/firmware/ 2>/dev/null

echo "Script diy-part2.sh completato!"
