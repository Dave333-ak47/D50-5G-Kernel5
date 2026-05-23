#!/bin/bash
rm -rf package/luci-app-exigod50
git clone https://github.com/Dave333-ak47/d50-modem-feed package/luci-app-exigod50
mkdir -p package/base-files/files/lib/firmware/
if [ -d "wi-fi" ]; then
    cp -r wi-fi/Bdwlan* package/base-files/files/lib/firmware/
else
    cp -r Bdwlan* package/base-files/files/lib/firmware/ 2>/dev/null
fi
