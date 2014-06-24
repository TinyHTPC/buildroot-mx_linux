###############################################################################
#
## Xbmc script.module.requests Addon
#
###############################################################################
REQUESTS_VERSION = 1.1.0
REQUESTS_SOURCE = script.module.requests-$(REQUESTS_VERSION).zip
REQUESTS_SITE = http://mirrors.xbmc.org/addons/frodo/script.module.requests/
REQUESTS_INSTALL_STAGING = NO
REQUESTS_INSTALL_TARGET = YES

define REQUESTS_EXTRACT_CMDS
	unzip $(DL_DIR)/$(REQUESTS_SOURCE) -d $(@D)
endef

define REQUESTS_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.module.requests $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,requests))
