###############################################################################
#
## Xbmc script.globalsearch Addon
#
###############################################################################
GLOBALSEARCH_VERSION = 2.0.8
GLOBALSEARCH_SOURCE = script.globalsearch-$(GLOBALSEARCH_VERSION).zip
GLOBALSEARCH_SITE = http://mirrors.xbmc.org/addons/gotham/script.globalsearch/
GLOBALSEARCH_INSTALL_STAGING = NO
GLOBALSEARCH_INSTALL_TARGET = YES

define GLOBALSEARCH_EXTRACT_CMDS
	unzip $(DL_DIR)/$(GLOBALSEARCH_SOURCE) -d $(@D)
endef

define GLOBALSEARCH_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.globalsearch $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,globalsearch))
