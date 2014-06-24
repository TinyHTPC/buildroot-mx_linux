###############################################################################
#
## Xbmc script.favourites Addon
#
###############################################################################
FAVOURITES_VERSION = 5.0.2
FAVOURITES_SOURCE = script.favourites-$(FAVOURITES_VERSION).zip
FAVOURITES_SITE = http://mirrors.xbmc.org/addons/gotham/script.favourites/
FAVOURITES_INSTALL_STAGING = NO
FAVOURITES_INSTALL_TARGET = YES

define FAVOURITES_EXTRACT_CMDS
	unzip $(DL_DIR)/$(FAVOURITES_SOURCE) -d $(@D)
endef

define FAVOURITES_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.favourites $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,favourites))
