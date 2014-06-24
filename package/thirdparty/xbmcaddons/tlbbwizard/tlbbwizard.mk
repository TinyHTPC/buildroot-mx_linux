###############################################################################
#
## Xbmc plugin.video.tlbbwizard Addon
#
###############################################################################
TLBBWIZARD_VERSION = 1.0.1
TLBBWIZARD_SOURCE = plugin.video.tlbbwizard-$(TLBBWIZARD_VERSION).zip
TLBBWIZARD_SITE = http://cloud.thelittleblackbox.co.uk/repo/zips/plugin.video.tlbbwizard/
TLBBWIZARD_INSTALL_STAGING = NO
TLBBWIZARD_INSTALL_TARGET = YES

define TLBBWIZARD_EXTRACT_CMDS
	unzip $(DL_DIR)/$(TLBBWIZARD_SOURCE) -d $(@D)
endef

define TLBBWIZARD_INSTALL_TARGET_CMDS
	cp -rf $(@D)/plugin.video.tlbbwizard $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,tlbbwizard))
