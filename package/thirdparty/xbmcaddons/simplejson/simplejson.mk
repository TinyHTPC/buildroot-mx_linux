###############################################################################
#
## Xbmc script.module.simplejson Addon
#
###############################################################################
SIMPLEJSON_VERSION = 3.3.0
SIMPLEJSON_SOURCE = script.module.simplejson-$(SIMPLEJSON_VERSION).zip
SIMPLEJSON_SITE = http://mirrors.xbmc.org/addons/frodo/script.module.simplejson/
SIMPLEJSON_INSTALL_STAGING = NO
SIMPLEJSON_INSTALL_TARGET = YES

define SIMPLEJSON_EXTRACT_CMDS
	unzip $(DL_DIR)/$(SIMPLEJSON_SOURCE) -d $(@D)
endef

define SIMPLEJSON_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.module.simplejson $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,simplejson))
