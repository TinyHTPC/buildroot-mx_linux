import xbmcgui
import services.lib.backuputils as backuputils
from services.lib.backup import XbmcBackup

#the program mode
mode = -1

#check if mode was passed in as an argument
if(len(sys.argv) > 1):
    if(sys.argv[1].lower() == 'backup'):
        mode = 0
    elif(sys.argv[1].lower() == 'restore'):
        mode = 1

if(mode == -1):
    #figure out if this is a backup or a restore from the user
    mode = xbmcgui.Dialog().select(backuputils.getString(30010) + " - " + backuputils.getString(30023),[backuputils.getString(30016),backuputils.getString(30017)])

if(mode != -1):
    #run the profile backup
    backup = XbmcBackup()

    if(backup.remoteConfigured()):

        if(mode == backup.Restore):
            #allow user to select the backup to restore from
            restorePoints = backup.listBackups()
            pointNames = []

            for aDir in restorePoints:
                pointNames.append(aDir[1])
                
            selectedRestore = xbmcgui.Dialog().select(backuputils.getString(30010) + " - " + backuputils.getString(30021),pointNames)

            if(selectedRestore != -1):
                backup.selectRestore(restorePoints[selectedRestore][0])
                    
        backup.run(mode)
    else:
        #can't go any further
        xbmcgui.Dialog().ok(backuputils.getString(30010),backuputils.getString(30045))
        backuputils.openSettings()
