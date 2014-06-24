###############################################################################
#
## Xbmc plugin.video.youtube Addon
#
###############################################################################
YOUTUBE_VERSION = 4.4.6
YOUTUBE_SOURCE = plugin.video.youtube-$(YOUTUBE_VERSION).zip
YOUTUBE_SITE = http://mirrors.xbmc.org/addons/frodo/plugin.video.youtube/
YOUTUBE_INSTALL_STAGING = NO
YOUTUBE_INSTALL_TARGET = YES

define YOUTUBE_EXTRACT_CMDS
	unzip $(DL_DIR)/$(YOUTUBE_SOURCE) -d $(@D)
endef

define YOUTUBE_INSTALL_TARGET_CMDS
	cp -rf $(@D)/plugin.video.youtube $(TARGET_DIR)/usr/share/xbmc/addons/
endef

$(eval $(call xbmc-addon,package/thirdparty/xbmcaddons,youtube))
