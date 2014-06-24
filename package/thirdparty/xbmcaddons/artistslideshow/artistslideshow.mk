###############################################################################
#
## Xbmc script.artistslideshow Addon
#
###############################################################################
ARTISTSLIDESHOW_VERSION = 1.6.5
ARTISTSLIDESHOW_SOURCE = script.artistslideshow-$(ARTISTSLIDESHOW_VERSION).zip
ARTISTSLIDESHOW_SITE = http://mirrors.xbmc.org/addons/frodo/script.artistslideshow/
ARTISTSLIDESHOW_INSTALL_STAGING = NO
ARTISTSLIDESHOW_INSTALL_TARGET = YES

define ARTISTSLIDESHOW_EXTRACT_CMDS
	unzip $(DL_DIR)/$(ARTISTSLIDESHOW_SOURCE) -d $(@D)
endef

define ARTISTSLIDESHOW_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.artistslideshow $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,artistslideshow))
