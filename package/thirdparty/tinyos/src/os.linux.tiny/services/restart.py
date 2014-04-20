import xbmcgui
import xbmc
from resources.lib.service import service
from xbmcaddon import Addon
from resources.lib.utils import *
import os
import xbmcaddon
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
UPDATEID    = 'script.tiny'
run=None

def APPLYCHANGES():
        dialog = xbmcgui.Dialog()      
        dp = xbmcgui.DialogProgress()
        #dp.create("TinyHTPC Add-on","Starting... ",'', 'Please Wait')	
	#time.sleep(10)
        #dp.update(0,"", "Applying settings...  Please Wait")

	#restart Update script
	run = UPDATEID
        #xbmc.executebuiltin('StopScript(special://home/addons/script.tiny/service.py)')
        xbmc.executebuiltin('StopScript(script.tiny)')
	#xbmcaddon.Addon(run).setSetting("service_enabled", "false") 
        xbmc.executebuiltin('RunAddon(script.tiny)')
        
        
        #dp.update(0,"", "Applying settings...  Please Wait")
        #extract.all(lib,addonfolder,dp)
        #xbmc.executebuiltin('UpdateLocalAddons')
        #xbmc.executebuiltin( 'UpdateAddonRepos' )
        #dialog.ok("TinyOS add-on Installer", "All Done","", "[COLOR yellow]Brought To You By TinyHTPC[/COLOR]")


class restart(service):
    def onStart(self):
        #check for installed updates   
	if run==None or len(run)<1:
		APPLYCHANGES()     
        		
