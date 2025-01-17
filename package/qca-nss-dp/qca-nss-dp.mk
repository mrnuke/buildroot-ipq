################################################################################
#
# qca-nss-dp
#
################################################################################

QCA_NSS_DP_VERSION = fa67464466f69f00967cc373d1bdd6025f57eb89
QCA_NSS_DP_SITE = https://git.codelinaro.org/clo/qsdk/oss/lklm/nss-dp.git
QCA_NSS_DP_SITE_METHOD = git
QCA_NSS_DP_LICENSE = Dual BSD/GPL
QCA_NSS_DP_DEPENDENCIES = qca-ssdk

QCA_NSS_DP_MODULE_MAKE_OPTS = \
	SoC=ipq95xx \
	dp-ppe-ds=n \
	KBUILD_EXTRA_SYMBOLS="$(shell echo $(STAGING_DIR)/usr/include/qca-ssdk/Module.symvers $(STAGING_DIR)/usr/include/qca-nss-ppe/Module.symvers)" \
	EXTRA_CFLAGS="-I$(STAGING_DIR)/usr/include/qca-ssdk -I$(STAGING_DIR)/usr/include/qca-nss-ppe"

$(eval $(kernel-module))

define QCA_NSS_DP_FIX_HEADERS
	ln -fs $(@D)/hal/soc_ops/ipq95xx/nss_ipq95xx.h $(@D)/exports/nss_dp_arch.h
endef
QCA_NSS_DP_PRE_BUILD_HOOKS += QCA_NSS_DP_FIX_HEADERS

define QCA_NSS_DP_INSTALL_STAGING_HEADERS
	$(INSTALL) -d $(STAGING_DIR)/usr/include/qca-nss-dp
	cp -r $(@D)/exports/* $(STAGING_DIR)/usr/include/qca-nss-dp
endef

define QCA_NSS_DP_INSTALL_MOD_SYM
	cp  $(@D)/Module.symvers $(STAGING_DIR)/usr/include/qca-nss-dp
endef
QCA_NSS_DP_POST_BUILD_HOOKS += QCA_NSS_DP_INSTALL_STAGING_HEADERS QCA_NSS_DP_INSTALL_MOD_SYM

$(eval $(generic-package))
