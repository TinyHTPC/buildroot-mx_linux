###############################################################################
#
## Xbmc plugin.video.tlbbinstaller Addon
#
###############################################################################
TLBBINSTALLER_VERSION = 1.0.7
TLBBINSTALLER_SOURCE = plugin.video.tlbbinstaller-$(TLBBINSTALLER_VERSION).zip
TLBBINSTALLER_SITE = http://cloud.thelittleblackbox.co.uk/repo/zips/plugin.video.tlbbinstaller/
TLBBINSTALLER_INSTALL_STAGING = NO
TLBBINSTALLER_INSTALL_TARGET = YES

define TLBBINSTALLER_EXTRACT_CMDS
	unzip $(DL_DIR)/$(TLBBINSTALLER_SOURCE) -d $(@D)
endef

define TLBBINSTALLER_INSTALL_TARGET_CMDS
	cp -rf $(@D)/plugin.video.tlbbinstaller $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,tlbbinstaller))
