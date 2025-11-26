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

define ATH11K_FIRMWARE_TPLINK_INSTALL_TARGET_CMDS
	$(ATH11K_FIRMWARE_TPLINK_IPQ9574_INSTALL_TARGET_CMD)
endef

$(eval $(generic-package))
