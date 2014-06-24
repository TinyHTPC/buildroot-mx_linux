###############################################################################
#
## Xbmc script.libraryeditor Addon
#
###############################################################################
LIBRARYEDITOR_VERSION = 7ba506c4be3577e02f0286414a1685f5d90cf9d3
LIBRARYEDITOR_SITE = https://github.com/phil65/script.libraryeditor.git
LIBRARYEDITOR_SITE_METHOD = git
LIBRARYEDITOR_INSTALL_STAGING = NO
LIBRARYEDITOR_INSTALL_TARGET = YES

define LIBRARYEDITOR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/xbmc/addons/script.libraryeditor
	cp -rf $(@D)/* $(TARGET_DIR)/usr/share/xbmc/addons/script.libraryeditor/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,libraryeditor))
