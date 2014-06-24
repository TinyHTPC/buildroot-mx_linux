###############################################################################
#
## Xbmc TinyOS Addon
#
###############################################################################
TINYOS_VERSION = c710634a9fc6119764ffeac901f4964661a6e9cc
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
