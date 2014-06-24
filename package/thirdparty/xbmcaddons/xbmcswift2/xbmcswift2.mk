###############################################################################
#
## Xbmc script.module.xbmcswift2 Addon
#
###############################################################################
XBMCSWIFT2_VERSION = 2.4.0
XBMCSWIFT2_SOURCE = script.module.xbmcswift2-$(XBMCSWIFT2_VERSION).zip
XBMCSWIFT2_SITE = http://mirrors.xbmc.org/addons/frodo/script.module.xbmcswift2/
XBMCSWIFT2_INSTALL_STAGING = NO
XBMCSWIFT2_INSTALL_TARGET = YES

define XBMCSWIFT2_EXTRACT_CMDS
	unzip $(DL_DIR)/$(XBMCSWIFT2_SOURCE) -d $(@D)
endef

define XBMCSWIFT2_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.module.xbmcswift2 $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,xbmcswift2))
