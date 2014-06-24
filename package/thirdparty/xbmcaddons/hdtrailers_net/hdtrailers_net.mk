###############################################################################
#
## Xbmc hdtrailers_net Addon
#
###############################################################################
HDTRAILERS_NET_VERSION = 1.2.2
HDTRAILERS_NET_SOURCE = plugin.video.hdtrailers_net-$(HDTRAILERS_NET_VERSION).zip
HDTRAILERS_NET_SITE = http://mirrors.xbmc.org/addons/frodo/plugin.video.hdtrailers_net/
HDTRAILERS_NET_INSTALL_STAGING = NO
HDTRAILERS_NET_INSTALL_TARGET = YES

define HDTRAILERS_NET_EXTRACT_CMDS
	unzip $(DL_DIR)/$(HDTRAILERS_NET_SOURCE) -d $(@D)
endef

define HDTRAILERS_NET_INSTALL_TARGET_CMDS
	cp -rf $(@D)/plugin.video.hdtrailers_net $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,hdtrailers_net))
