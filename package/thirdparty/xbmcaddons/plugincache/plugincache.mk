###############################################################################
#
## Xbmc script.common.plugin.cache Addon
#
###############################################################################
PLUGINCACHE_VERSION = 2.5.4
PLUGINCACHE_SOURCE = script.common.plugin.cache-$(PLUGINCACHE_VERSION).zip
PLUGINCACHE_SITE = http://mirrors.xbmc.org/addons/frodo/script.common.plugin.cache/
PLUGINCACHE_INSTALL_STAGING = NO
PLUGINCACHE_INSTALL_TARGET = YES

define PLUGINCACHE_EXTRACT_CMDS
	unzip $(DL_DIR)/$(PLUGINCACHE_SOURCE) -d $(@D)
endef

define PLUGINCACHE_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.common.plugin.cache $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,plugincache))
