###############################################################################
#
## Xbmc TinyOS Addon
#
###############################################################################
TINYOS_VERSION = d5fc7b3fd2e15697e02ad6b39310896aece0e863
TINYOS_SOURCE=tinyos-$(TINYOS_VERSION).tar.gz
TINYOS_SITE = git://github.com/TinyHTPC/linux-tinyos.git
TINYOS_SITE_METHOD = git
TINYOS_INSTALL_STAGING = NO
TINYOS_INSTALL_TARGET = YES

define TINYOS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/xbmc/addons/
	cp -rf $(@D)/* $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty,tinyos))
