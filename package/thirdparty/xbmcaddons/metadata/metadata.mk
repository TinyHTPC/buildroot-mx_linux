###############################################################################
#
## Xbmc script.metadata.actors Addon
#
###############################################################################
METADATA_VERSION = 0.9.8
METADATA_SOURCE = script.metadata-$(METADATA_VERSION).zip
METADATA_SITE = http://cloud.thelittleblackbox.co.uk/repo/zips/
METADATA_INSTALL_STAGING = NO
METADATA_INSTALL_TARGET = YES

define METADATA_EXTRACT_CMDS
	unzip $(DL_DIR)/$(METADATA_SOURCE) -d $(@D)
endef

define METADATA_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.metadata.actors $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,metadata))
