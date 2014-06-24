###############################################################################
#
## Xbmc script.videolanguage Addon
#
###############################################################################
VIDEOLANGUAGE_VERSION = 0.1.0
VIDEOLANGUAGE_SOURCE = script.videolanguage-$(VIDEOLANGUAGE_VERSION).zip
VIDEOLANGUAGE_SITE = http://cloud.thelittleblackbox.co.uk/repo/zips/
VIDEOLANGUAGE_INSTALL_STAGING = NO
VIDEOLANGUAGE_INSTALL_TARGET = YES

define VIDEOLANGUAGE_EXTRACT_CMDS
	unzip $(DL_DIR)/$(VIDEOLANGUAGE_SOURCE) -d $(@D)
endef

define VIDEOLANGUAGE_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.videolanguage-master $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,videolanguage))
