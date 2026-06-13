define Device/xunison_exigo_hub_d50_5g
  DEVICE_VENDOR := Xunison
  DEVICE_MODEL := Exigo Hub D50 5G
  DEVICE_DTS := qcom/ipq5018-exigo-hub-d50-5g
  DEVICE_PACKAGES := kmod-ath11k-pci ath11k-firmware-ipq5018 ath11k-firmware-qcn9074 \
                     kmod-pcie-mhi kmod-qrtr kmod-qrtr-mhi kmod-qcom-qmi-helpers \
                     kmod-rmnet-core kmod-rmnet-ctl kmod-rmnet-nss \
                     qmodem qmodem-utils qmodem-nr qmodem-lte qmodem-lock qmodem-diag \
                     qmodem-signal qmodem-stats luci-app-qmodem luci-app-qmodem-sms luci-app-qmodem-ttl
endef
TARGET_DEVICES += xunison_exigo_hub_d50_5g
