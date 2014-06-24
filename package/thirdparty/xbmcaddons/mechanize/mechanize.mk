###############################################################################
#
## Xbmc script.module.mechanize Addon
#
###############################################################################
MECHANIZE_VERSION = 0.2.6
MECHANIZE_SOURCE = script.module.mechanize-$(MECHANIZE_VERSION).zip
MECHANIZE_SITE = http://mirrors.xbmc.org/addons/frodo/script.module.mechanize/
MECHANIZE_INSTALL_STAGING = NO
MECHANIZE_INSTALL_TARGET = YES

define MECHANIZE_EXTRACT_CMDS
	unzip $(DL_DIR)/$(MECHANIZE_SOURCE) -d $(@D)
endef

define MECHANIZE_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.module.mechanize $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,mechanize))
