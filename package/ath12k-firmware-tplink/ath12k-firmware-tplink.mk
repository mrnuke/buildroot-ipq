################################################################################
#
# ath12k-firmware-tplink
#
################################################################################

ATH12K_FIRMWARE_TPLINK_LICENSE = Proprietary

# QCN9274 firmware
ifeq ($(BR2_PACKAGE_ATH12K_FIRMWARE_TPLINK_QCN9224),y)
define ATH12K_FIRMWARE_QCN9224_INSTALL_TARGET_CMD
	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/ath12k/QCN9274/hw2.0
	$(INSTALL) $(ATH12K_FIRMWARE_TPLINK_PKGDIR)/qcn9224/* $(TARGET_DIR)/lib/firmware/ath12k/QCN9274/hw2.0
endef
endif

ifeq ($(BR2_PACKAGE_ATH12K_BDF_TPLINK_BE550),y)
define ATH12K_BDF_TPLINK_BE550_TARGET_CMD
	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/ath12k/QCN9274/hw2.0
	$(INSTALL) $(ATH12K_FIRMWARE_TPLINK_PKGDIR)/be550/* $(TARGET_DIR)/lib/firmware/ath12k/QCN9274/hw2.0
endef
endif

define ATH12K_FIRMWARE_TPLINK_INSTALL_TARGET_CMDS
	$(ATH12K_FIRMWARE_QCN9224_INSTALL_TARGET_CMD)
	$(ATH12K_BDF_TPLINK_BE550_TARGET_CMD)
endef

$(eval $(generic-package))
