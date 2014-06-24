###############################################################################
#
## Xbmc script.artwork.downloader Addon
#
###############################################################################
ARTWORK_DOWNLOADER_VERSION = 12.0.25
ARTWORK_DOWNLOADER_SOURCE = script.artwork.downloader-$(ARTWORK_DOWNLOADER_VERSION).zip
ARTWORK_DOWNLOADER_SITE = http://mirrors.xbmc.org/addons/frodo/script.artwork.downloader/
ARTWORK_DOWNLOADER_INSTALL_STAGING = NO
ARTWORK_DOWNLOADER_INSTALL_TARGET = YES

define ARTWORK_DOWNLOADER_EXTRACT_CMDS
	unzip $(DL_DIR)/$(ARTWORK_DOWNLOADER_SOURCE) -d $(@D)
endef

define ARTWORK_DOWNLOADER_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.artwork.downloader $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,artwork_downloader))
