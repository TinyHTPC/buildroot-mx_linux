###############################################################################
#
## Xbmc script.tvtunes Addon
#
###############################################################################
TVTUNES_VERSION = 4.4.3
TVTUNES_SOURCE = script.tvtunes-$(TVTUNES_VERSION).zip
TVTUNES_SITE = http://mirrors.xbmc.org/addons/frodo/script.tvtunes/
TVTUNES_INSTALL_STAGING = NO
TVTUNES_INSTALL_TARGET = YES

define TVTUNES_EXTRACT_CMDS
	unzip $(DL_DIR)/$(TVTUNES_SOURCE) -d $(@D)
endef

define TVTUNES_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.tvtunes $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,tvtunes))
