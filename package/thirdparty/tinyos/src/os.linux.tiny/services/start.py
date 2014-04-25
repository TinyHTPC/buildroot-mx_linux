import xbmcgui
import xbmc
import xbmcaddon
from resources.lib.service import service
from xbmcaddon import Addon
from resources.lib.utils import *
import os
import shutil
import resources.lib.extract
import time

__addonID__ = "os.linux.tiny"
ADDON     = Addon( __addonID__ )
ADDON_DATA  = xbmc.translatePath( "special://profile/addon_data/%s/" % __addonID__ )
ADDON_DIR = ADDON.getAddonInfo( "path" )
LangXBMC  = xbmc.getLocalizedString
ROOTDIR            = ADDON_DIR
FILES = xbmc.translatePath( ADDON_DIR + "/resources/files/" )
DEST = xbmc.translatePath( "special://home/" )
run=None

def EXECUTE():
        dialog = xbmcgui.Dialog()      
        dp = xbmcgui.DialogProgress()
        #dp.create("TinyHTPC Add-on","Starting... ",'', 'Please Wait')	
	#time.sleep(10)
        #dp.update(0,"", "Applying settings...  Please Wait")

	#restart ntp service
	time.sleep(10)
	print "Refresh ntp"
	os.system('exec ntpdate -u pool.ntp.org')
	
	#Execute XBMC built-in functions
        xbmc.executebuiltin('UpdateLocalAddons')
        xbmc.executebuiltin( 'UpdateAddonRepos' )
        
        
        #dp.update(0,"", "Applying settings...  Please Wait")
        #extract.all(lib,addonfolder,dp)
        #xbmc.executebuiltin('UpdateLocalAddons')
        #xbmc.executebuiltin( 'UpdateAddonRepos' )
        #dialog.ok("TinyOS add-on Installer", "All Done","", "[COLOR yellow]Brought To You By TinyHTPC[/COLOR]")


class start(service):
    def onStart(self):
        #check for installed updates   
	if run==None or len(run)<1:
		EXECUTE()     
        		
