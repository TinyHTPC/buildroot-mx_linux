import xbmcgui
import xbmc
from resources.lib.service import service
from xbmcaddon import Addon
from resources.lib.utils import *
import os
import shutil
import resources.lib.extract as extract

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
        dp.create("Patching TinyHTPC","Downloading ",'', 'Please Wait')
        
        #use variable to change keyword for future updates 
        keyword      =  'update-1.0.0'
        src = FILES+keyword+'.zip'
        
        path         =  xbmc.translatePath(os.path.join('special://home/addons','packages'))
        lib          =  os.path.join(path, keyword+'.zip')
        addonfolder  =  xbmc.translatePath(os.path.join('special://home',''))
        
	shutil.copy2(src, path)
        
        dp.update(0,"", "Extracting Zip... Please Wait")
        extract.all(lib,addonfolder,dp)
        #xbmc.executebuiltin('UpdateLocalAddons')
        #xbmc.executebuiltin( 'UpdateAddonRepos' )
        #dialog.ok("TinyOS add-on Installer", "All Done","", "[COLOR yellow]Brought To You By TinyHTPC[/COLOR]")
        dp.update(100,"", "Reloading XBMC")
        #dialog.ok("TinyOS", "Reloading XBMC","", "[COLOR yellow]Brought To You By TinyHTPC[/COLOR]")
	#Restart XBMC
	xbmc.executebuiltin('RestartApp')


class firstrun(service):
    def onStart(self):
        #check for installed updates        
        firstlock100 = os.path.join(ADDON_DATA,'.update-1.0.0')
        if not os.path.isfile(firstlock100) :
        	        if not os.path.exists(ADDON_DATA):
                            os.mkdir(ADDON_DATA)
		#Run First-Run wizzard
			#xbmc.executebuiltin('XBMC.RunScript(os.linux.tiny,mode=2)')
        	#set default preference:			
			#self.dlg = xbmcgui.WindowXMLDialog('welcomeDialog.xml',ROOTDIR)
			#self.dlg.doModal()

			if src==None or len(src)<1:
				INSTALL()
			
			#xbmcgui.Dialog().ok('Welcome to TinyOS','Thanks for choosing Tiny Home Theatre PCs','to configure your box, go to','System -> XBian')
			open(firstlock100,'w').close()			
