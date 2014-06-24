###############################################################################
#
## Xbmc script.tv.show.next.aired Addon
#
###############################################################################
NEXTAIRED_VERSION = 6.0.10
NEXTAIRED_SOURCE = script.tv.show.next.aired-$(NEXTAIRED_VERSION).zip
NEXTAIRED_SITE = http://mirrors.xbmc.org/addons/frodo/script.tv.show.next.aired/
NEXTAIRED_INSTALL_STAGING = NO
NEXTAIRED_INSTALL_TARGET = YES

define NEXTAIRED_EXTRACT_CMDS
	unzip $(DL_DIR)/$(NEXTAIRED_SOURCE) -d $(@D)
endef

define NEXTAIRED_INSTALL_TARGET_CMDS
	cp -rf $(@D)/script.tv.show.next.aired $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,nextaired))
