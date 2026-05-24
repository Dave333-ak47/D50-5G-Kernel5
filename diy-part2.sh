
#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 1. Pulizia e Clone del feed personalizzato per il modem dell'Exigo D50
rm -rf package/luci-app-exigod50
git clone https://github.com/Dave333-ak47/d50-modem-feed package/luci-app-exigod50

# 2. Struttura cartelle e Iniezione file di calibrazione Wi-Fi Bdwlan
mkdir -p package/base-files/files/lib/firmware/
if [ -d "wi-fi" ]; then
    echo "Rilevata cartella wi-fi, copia dei file Bdwlan in corso..."
    cp -r wi-fi/Bdwlan* package/base-files/files/lib/firmware/
else
    echo "Copia dei file Bdwlan dalla directory principale in corso..."
    cp -r Bdwlan* package/base-files/files/lib/firmware/ 2>/dev/null
fi

# 3. PATCH DEL MODEM 5G (Iniezione ID USB nel driver option del Kernel)
# Questo aggiunge il supporto hardware per far riconoscere le porte di comunicazione del modem
echo "Applicazione della patch per il modem 5G in corso..."
KERNEL_DIR=$(find build_dir/target-*/linux-*/linux-5.* -maxdepth 0 2>/dev/null)
# Se il compilatore non ha ancora creato la build_dir (perché siamo all'inizio), 
# applichiamo la patch direttamente nei sorgenti dei pacchetti del kernel di OpenWrt
sed -i '/{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x9003) }/a \t{ USB_DEVICE(0x2c7c, 0x0800) }, /* Quectel RM500Q / Exigo 5G Modem */' target/linux/generic/pending-5.4/??*-option*.patch 2>/dev/null || true

# Se invece usi una patch strutturata dentro il feed, la scarichiamo o la copiamo qui:
# (Se hai un file .patch specifico nel tuo PC o repository, fammelo sapere che lo integriamo qui)

echo "Script diy-part2.sh (con patch modem inclusa) eseguito!"
