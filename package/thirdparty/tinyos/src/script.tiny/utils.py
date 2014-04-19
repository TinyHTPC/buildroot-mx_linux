#
#      Copyright (C) 2013 Sean Poyser
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with XBMC; see the file COPYING.  If not, write to
#  the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
#  http://www.gnu.org/copyleft/gpl.html
#

import xbmc
import xbmcaddon
import xbmcgui
import os

ID    = 'script.tiny'
ADDON = xbmcaddon.Addon(ID)
PATCHID = 'os.linux.tiny'
PATCH = xbmcaddon.Addon(PATCHID)
#OTAPATH  = xbmc.translatePath( "special://profile/addon_data/%s/" PATCH )
#OTA  = OTAPATH+ota_version
PATCHVERSION = PATCH.getAddonInfo( "version" )

def log(text):
    #xbmc.log("[TinyHTPC] : %s" % str(text), xbmc.LOGDEBUG)
    xbmc.log("[TinyHTPC] : %s" % str(text))
        

def getString(id):
     return ADDON.getLocalizedString(id)  


def getUserdataPath(translate = True):
    path = ADDON.getAddonInfo('profile')

    if not translate:
        return path

    return xbmc.translatePath(path)


def getAddonPath(translate = True):
    path = ADDON.getAddonInfo('path')

    if not translate:
        return path

    return xbmc.translatePath(path)


def getSystem():
    system            = dict()
    processor         = 'Unknown'
    system['machine'] = 'unknown'

    try:        
        if hasattr(os, 'uname'):
            #unix
            (sysname, nodename, release, version, machine) = os.uname()
        else:
            #Windows (and others?)
            import platform
            (sysname, nodename, release, version, machine, processor) = platform.uname()

        system['nodename']  = nodename
        system['sysname']   = sysname
        system['release']   = release
        system['version']   = version
        system['machine']   = machine
        system['processor'] = processor
    except Exception as ex:
        import sys
        system['sysname']   = sys.platform
        system['exception'] = str(ex)

    return system


def setSetting(setting, value):
    xbmcaddon.Addon(id = ID).setSetting(setting, value)



def saveOta():
    #f = open(OTA).read()
    f = PATCHVERSION
    xbmcaddon.Addon(id = ID).setSetting('cVersion', f)


def getSetting(setting):
    return xbmcaddon.Addon(id = ID).getSetting(setting)



def deleteFile(filename, attempts = 5):
    while os.path.exists(filename) and (attempts > 0): 
        attempts -= 1
        try: 
            os.remove(filename) 
            break 
        except: 
            pass 


def unflagUpdate():
    xbmcgui.Window(10000).clearProperty('update.available')


def flagUpdate():
    xbmcgui.Window(10000).setProperty('update.available', 'yes')


def generateMD5(path):
    if not os.path.exists(path):
        return '0'

    try:
        import hashlib
        return hashlib.md5(open(path, 'r').read()).hexdigest()
        
    except:
        pass

    try:
        import md5
        return md5.new(open(path, 'r').read() ).hexdigest()
    except:
        pass
        
    return '0'


def ok(title, line1, line2 = 0, line3 = 0):
    dlg = xbmcgui.Dialog()
    dlg.ok(getString(title), getString(line1), getString(line2), getString(line3))


def yesno(title, line1, line2 = 0, line3 = 0, no = 3, yes = 2):
    dlg = xbmcgui.Dialog()
    return dlg.yesno(getString(title), getString(line1), getString(line2), getString(line3), getString(no), getString(yes)) == 1


def hideCancelButton():
    #xbmc.sleep(250)
    WINDOW_PROGRESS = xbmcgui.Window(10101)
    CANCEL_BUTTON   = WINDOW_PROGRESS.getControl(10)
    CANCEL_BUTTON.setVisible(False)


def progress(title, line1 = 0, line2 = 0, line3 = 0, hide = False):
    dp = xbmcgui.DialogProgress()
    dp.create(getString(title), getString(line1), getString(line2), getString(line3))
    dp.update(0)
    if hide:
        hideCancelButton()
    return dp


def okReboot(title, line1, line2, line3 = 0, delay = 15):
    count = delay
    line1 = getString(line1)
    final = getString(line2+1)
    line2 = getString(line2)
    line3 = getString(line3)

    dp = xbmcgui.DialogProgress()
    dp.create(getString(title), line1, line2 % count, line3)
    dp.update(0)
              
    while count > 0 and not dp.iscanceled():
        xbmc.sleep(1000)
        count -= 1
        perc = int(((delay - count) / float(delay)) * 100)
        if count > 1:
            dp.update(perc, line1, line2 % count, line3)
        else:
            dp.update(perc, line1, final % count, line3)            

    return not dp.iscanceled()

class Busy(xbmcgui.WindowXMLDialog):
    def __init__(self, *args, **kwargs):
        self.cmd = kwargs['cmd']         

    def onInit(self):
        os.system(self.cmd)


def rebootCommand(silent):
    dialog=xbmcgui.Dialog()
    if silent=='2':
        perform=getString(103)
        cmd='reboot recovery'
    else:
        perform=getString(104)
        cmd='factoryreset'
    
    if dialog.yesno(getString(1), '','Are You Sure You Want To Perform '+perform, ""):
        os.system(cmd)
        
def reboot(cmd):
    dlg = Busy('busy.xml',ADDON.getAddonInfo('path'),'Default', cmd = cmd)
    dlg.doModal()
