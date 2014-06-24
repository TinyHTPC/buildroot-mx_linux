TLBB_VERSION = 545aec9af5a0029ced17fce56e4b632b5125f581
TLBB_SITE_METHOD = git
TLBB_SITE = https://github.com/Nessus85100/tlbb.git
TLBB_INSTALL_STAGING = YES
TLBB_INSTALL_TARGET = YES
TLBB_DEPENDENCIES = xbmc
TEXTURE_PACKER=$(XBMC_DIR)/tools/TexturePacker/TexturePacker

define TLBB_BUILD_CMDS
    	sed -i 's/script.tlbb/script.tlbb.m3/' $(@D)/extras/scripts/update.py
	$(TEXTURE_PACKER) -use_none -i $(@D)/media -o $(@D)/media/Textures.xbt
endef

define TLBB_INSTALL_STAGING_CMDS
        mkdir -p $(STAGING_DIR)/usr/share/xbmc/addons/skin.tlbb
        cp -rf $(@D)/* $(STAGING_DIR)/usr/share/xbmc/addons/skin.tlbb/
endef

define TLBB_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/xbmc/addons/skin.tlbb/media
	cd $(@D); cp -rf `ls -I media -1` $(TARGET_DIR)/usr/share/xbmc/addons/skin.tlbb
	cp -f $(@D)/media/Textures.xbt $(TARGET_DIR)/usr/share/xbmc/addons/skin.tlbb/media
endef

$(eval $(call xbmc-skin,package/thirdparty/xbmcskins,tlbb))
