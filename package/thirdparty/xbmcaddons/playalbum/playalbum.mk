###############################################################################
#
## Xbmc script.playalbum Addon
#
###############################################################################
PLAYALBUM_VERSION = 0.1.3
PLAYALBUM_SOURCE = script.playalbum-$(PLAYALBUM_VERSION).zip
PLAYALBUM_SITE = http://mirrors.xbmc.org/addons/frodo/script.playalbum/
PLAYALBUM_INSTALL_STAGING = NO
PLAYALBUM_INSTALL_TARGET = YES

define PLAYALBUM_EXTRACT_CMDS
	unzip $(DL_DIR)/$(PLAYALBUM_SOURCE) -d $(@D)
endef

define PLAYALBUM_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.playalbum $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,playalbum))
