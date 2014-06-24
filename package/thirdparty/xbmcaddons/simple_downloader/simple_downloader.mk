###############################################################################
#
## Xbmc script.module.simple.downloader Addon
#
###############################################################################
SIMPLE_DOWNLOADER_VERSION = 1.9.4
SIMPLE_DOWNLOADER_SOURCE = script.module.simple.downloader-$(SIMPLE_DOWNLOADER_VERSION).zip
SIMPLE_DOWNLOADER_SITE = http://mirrors.xbmc.org/addons/frodo/script.module.simple.downloader/
SIMPLE_DOWNLOADER_INSTALL_STAGING = NO
SIMPLE_DOWNLOADER_INSTALL_TARGET = YES

define SIMPLE_DOWNLOADER_EXTRACT_CMDS
	unzip $(DL_DIR)/$(SIMPLE_DOWNLOADER_SOURCE) -d $(@D)
endef

define SIMPLE_DOWNLOADER_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.module.simple.downloader $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,simple_downloader))
