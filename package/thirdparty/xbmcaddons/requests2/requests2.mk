###############################################################################
#
## Xbmc script.module.requests2 Addon
#
###############################################################################
REQUESTS2_VERSION = 2.2.1
REQUESTS2_SOURCE = script.module.requests2-$(REQUESTS2_VERSION).zip
REQUESTS2_SITE = http://mirrors.xbmc.org/addons/frodo/script.module.requests2/
REQUESTS2_INSTALL_STAGING = NO
REQUESTS2_INSTALL_TARGET = YES

define REQUESTS2_EXTRACT_CMDS
	unzip $(DL_DIR)/$(REQUESTS2_SOURCE) -d $(@D)
endef

define REQUESTS2_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.module.requests2 $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,requests2))
