###############################################################################
#
## Xbmc script.module.elementtree Addon
#
###############################################################################
ELEMENTTREE_VERSION = 1.2.8
ELEMENTTREE_SOURCE = script.module.elementtree-$(ELEMENTTREE_VERSION).zip
ELEMENTTREE_SITE = http://mirrors.xbmc.org/addons/frodo/script.module.elementtree/
ELEMENTTREE_INSTALL_STAGING = NO
ELEMENTTREE_INSTALL_TARGET = YES

define ELEMENTTREE_EXTRACT_CMDS
	unzip $(DL_DIR)/$(ELEMENTTREE_SOURCE) -d $(@D)
endef

define ELEMENTTREE_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.module.elementtree $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,elementtree))
