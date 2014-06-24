###############################################################################
#
## Xbmc script.xbmc.debug.log Addon
#
###############################################################################
DEBUGLOG_VERSION = 12.0.2
DEBUGLOG_SOURCE = script.xbmc.debug.log-$(DEBUGLOG_VERSION).zip
DEBUGLOG_SITE = http://mirrors.xbmc.org/addons/frodo/script.xbmc.debug.log/
DEBUGLOG_INSTALL_STAGING = NO
DEBUGLOG_INSTALL_TARGET = YES

define DEBUGLOG_EXTRACT_CMDS
	unzip $(DL_DIR)/$(DEBUGLOG_SOURCE) -d $(@D)
endef

define DEBUGLOG_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.xbmc.debug.log $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,debuglog))
