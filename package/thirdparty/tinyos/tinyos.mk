###############################################################################
#
## Xbmc TinyOS Addon
#
###############################################################################
TINYOS_VERSION = 0.0.1
TINYOS_SOURCE=tinyos-$(TINYOS_VERSION).tar.gz
TINYOS_SITE = ./package/thirdparty/tinyos/src
TINYOS_SITE_METHOD = local
TINYOS_INSTALL_STAGING = NO
TINYOS_INSTALL_TARGET = YES

define TINYOS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/xbmc/addons/
	cp -rf $(@D)/* $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,tinyos))
