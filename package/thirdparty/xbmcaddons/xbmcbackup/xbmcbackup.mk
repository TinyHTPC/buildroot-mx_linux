###############################################################################
#
## Xbmc script.xbmcbackup Addon
#
###############################################################################
XBMCBACKUP_VERSION = 0.4.7
XBMCBACKUP_SOURCE = script.xbmcbackup-$(XBMCBACKUP_VERSION).zip
XBMCBACKUP_SITE = http://mirrors.xbmc.org/addons/frodo/script.xbmcbackup/
XBMCBACKUP_INSTALL_STAGING = NO
XBMCBACKUP_INSTALL_TARGET = YES

define XBMCBACKUP_EXTRACT_CMDS
	unzip $(DL_DIR)/$(XBMCBACKUP_SOURCE) -d $(@D)
endef

define XBMCBACKUP_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.xbmcbackup $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,xbmcbackup))
