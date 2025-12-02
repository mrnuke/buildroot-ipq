################################################################################
#
# ath11k-firmware-tplink
#
################################################################################

ATH11K_FIRMWARE_TPLINK_LICENSE = Proprietary

ifeq ($(BR2_PACKAGE_ATH11K_FIRMWARE_TPLINK_IPQ9574),y)
define ATH11K_FIRMWARE_TPLINK_IPQ9574_INSTALL_TARGET_CMD
	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/IPQ9574
	$(INSTALL) $(ATH11K_FIRMWARE_TPLINK_PKGDIR)/IPQ9574/* $(TARGET_DIR)/lib/firmware/IPQ9574
endef
endif

# QCN50xx firmware
ifeq ($(BR2_PACKAGE_ATH11K_BDF_TPLINK_BE550),y)
define ATH11K_FIRMWARE_BDF_BE550_IPQ9574_INSTALL_TARGET_CMD
	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/ath11k/IPQ9574/hw1.0
	$(INSTALL) $(ATH11K_FIRMWARE_TPLINK_PKGDIR)/be550/* $(TARGET_DIR)/lib/firmware/ath11k/IPQ9574/hw1.0
endef
endif

define ATH11K_FIRMWARE_TPLINK_INSTALL_TARGET_CMDS
	$(ATH11K_FIRMWARE_TPLINK_IPQ9574_INSTALL_TARGET_CMD)
	$(ATH11K_FIRMWARE_BDF_BE550_IPQ9574_INSTALL_TARGET_CMD)
endef

$(eval $(generic-package))
