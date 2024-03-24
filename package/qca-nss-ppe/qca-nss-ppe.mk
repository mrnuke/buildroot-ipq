################################################################################
#
# qca-nss-ppe
#
################################################################################

QCA_NSS_PPE_VERSION = NHSS.QSDK.12.4.5.r5
QCA_NSS_PPE_SITE = https://git.codelinaro.org/clo/qsdk/oss/lklm/nss-ppe.git
QCA_NSS_PPE_SITE_METHOD = git
QCA_NSS_PPE_LICENSE = Dual BSD/GPL

QCA_NSS_PPE_MODULE_MAKE_OPTS = \
	SoC=ipq95xx \
	ppe-drv=y \
	KBUILD_EXTRA_SYMBOLS="$(shell echo $(STAGING_DIR)/usr/include/qca-ssdk/Module.symvers)" \
	EXTRA_CFLAGS="-I$(STAGING_DIR)/usr/include/qca-ssdk \
		      -I$(STAGING_DIR)/usr/include/qca-ssdk/init \
		      -I$(STAGING_DIR)/usr/include/qca-ssdk/fal"

$(eval $(kernel-module))


define QCA_NSS_PPE_INSTALL_STAGING_HEADERS
	$(INSTALL) -d $(STAGING_DIR)/usr/include/qca-nss-ppe
	cp -r $(@D)/exports/* $(STAGING_DIR)/usr/include/qca-nss-ppe
	cp -r $(@D)/drv/exports/* $(STAGING_DIR)/usr/include/qca-nss-ppe
endef

define QCA_NSS_PPE_INSTALL_MOD_SYM
	cp  $(@D)/Module.symvers $(STAGING_DIR)/usr/include/qca-nss-ppe
endef
QCA_NSS_PPE_POST_BUILD_HOOKS += QCA_NSS_PPE_INSTALL_STAGING_HEADERS QCA_NSS_PPE_INSTALL_MOD_SYM

$(eval $(generic-package))
