###############################################################################
#
## Xbmc script.module.beautifulsoup Addon
#
###############################################################################
BEAUTIFULSOUP_VERSION = 3.2.1
BEAUTIFULSOUP_SOURCE = script.module.beautifulsoup-$(BEAUTIFULSOUP_VERSION).zip
BEAUTIFULSOUP_SITE = http://mirrors.xbmc.org/addons/frodo/script.module.beautifulsoup/
BEAUTIFULSOUP_INSTALL_STAGING = NO
BEAUTIFULSOUP_INSTALL_TARGET = YES

define BEAUTIFULSOUP_EXTRACT_CMDS
	unzip $(DL_DIR)/$(BEAUTIFULSOUP_SOURCE) -d $(@D)
endef

define BEAUTIFULSOUP_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.module.beautifulsoup $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,beautifulsoup))
