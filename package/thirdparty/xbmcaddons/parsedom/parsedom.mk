###############################################################################
#
## Xbmc script.module.parsedom Addon
#
###############################################################################
PARSEDOM_VERSION = 2.5.2
PARSEDOM_SOURCE = script.module.parsedom-$(PARSEDOM_VERSION).zip
PARSEDOM_SITE = http://mirrors.xbmc.org/addons/frodo/script.module.parsedom/
PARSEDOM_INSTALL_STAGING = NO
PARSEDOM_INSTALL_TARGET = YES

define PARSEDOM_EXTRACT_CMDS
	unzip $(DL_DIR)/$(PARSEDOM_SOURCE) -d $(@D)
endef

define PARSEDOM_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.module.parsedom $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,parsedom))
