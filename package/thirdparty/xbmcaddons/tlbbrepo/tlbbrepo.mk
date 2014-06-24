###############################################################################
#
## Xbmc repository.tlbb
#
###############################################################################
TLBBREPO_VERSION = 1.0
TLBBREPO_SOURCE = repository.tlbb-$(TLBBREPO_VERSION).zip
TLBBREPO_SITE = http://cloud.thelittleblackbox.co.uk/repo/zips/repository.tlbb/
TLBBREPO_INSTALL_STAGING = NO
TLBBREPO_INSTALL_TARGET = YES

define TLBBREPO_EXTRACT_CMDS
	unzip $(DL_DIR)/$(TLBBREPO_SOURCE) -d $(@D)
endef

define TLBBREPO_INSTALL_TARGET_CMDS
	cp -rf $(@D)/repository.tlbb $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,tlbbrepo))
