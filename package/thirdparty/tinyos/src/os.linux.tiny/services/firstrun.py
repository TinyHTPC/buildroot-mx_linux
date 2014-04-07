import xbmcgui
import xbmc
from resources.lib.service import service
from xbmcaddon import Addon
from resources.lib.utils import *
import os
import shutil
import extract

__addonID__ = "os.linux.tiny"
ADDON     = Addon( __addonID__ )
ADDON_DATA  = xbmc.translatePath( "special://profile/addon_data/%s/" % __addonID__ )
ADDON_DIR = ADDON.getAddonInfo( "path" )
LangXBMC  = xbmc.getLocalizedString
ROOTDIR            = ADDON_DIR
FILES = xbmc.translatePath( ADDON_DIR + "/resources/files/" )
DEST = xbmc.translatePath( "special://home/" )
src=None

def INSTALL():
        dialog = xbmcgui.Dialog()      
        dp = xbmcgui.DialogProgress()
        dp.create("TinyHTPC Add-on","Downloading ",'', 'Please Wait')
        keyword      =  'addons'
        src = FILES+keyword+'.zip'
        path         =  xbmc.translatePath(os.path.join('special://home/addons','packages'))
        lib          =  os.path.join(path, keyword+'.zip')
        addonfolder  =  xbmc.translatePath(os.path.join('special://home',''))
        
	shutil.copy2(src, path)
        
        dp.update(0,"", "Extracting Zip Please Wait")
        extract.all(lib,addonfolder,dp)
        xbmc.executebuiltin('UpdateLocalAddons')
        xbmc.executebuiltin( 'UpdateAddonRepos' )
        #dialog.ok("TinyOS add-on Installer", "All Done","", "[COLOR yellow]Brought To You By TinyHTPC[/COLOR]")


class firstrun(service):
    def onStart(self):
        #check if first run        
        firstlock = os.path.join(ADDON_DATA,'.firstrun')
        if not os.path.isfile(firstlock) :
        	        if not os.path.exists(ADDON_DATA):
                            os.mkdir(ADDON_DATA)
			setSetting('advancedmode','0')
			setSetting('notifyonerror','1')
			setSetting('notifyonsuccess','1')
			setSetting('confirmationonchange','1')
        	#set default preference:			
			#self.dlg = xbmcgui.WindowXMLDialog('welcomeDialog.xml',ROOTDIR)
			#self.dlg.doModal()

			if src==None or len(src)<1:
				INSTALL()
			
			#xbmcgui.Dialog().ok('Welcome to XBian','Thanks to have chosen XBian','You can configure it, go to','System -> XBian')
			open(firstlock,'w').close()			
