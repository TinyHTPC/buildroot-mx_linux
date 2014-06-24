###############################################################################
#
## Xbmc script.extendedinfo Addon
#
###############################################################################
EXTENDEDINFO_VERSION = 0.0.5
EXTENDEDINFO_SOURCE = script.extendedinfo-$(EXTENDEDINFO_VERSION).zip
EXTENDEDINFO_SITE = http://cloud.thelittleblackbox.co.uk/repo/zips/
EXTENDEDINFO_INSTALL_STAGING = NO
EXTENDEDINFO_INSTALL_TARGET = YES

define EXTENDEDINFO_EXTRACT_CMDS
	unzip $(DL_DIR)/$(EXTENDEDINFO_SOURCE) -d $(@D)
endef

define EXTENDEDINFO_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.extendedinfo $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,extendedinfo))
