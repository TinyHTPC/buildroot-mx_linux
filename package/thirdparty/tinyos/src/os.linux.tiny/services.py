import xbmc
import xbmcgui
import os

	
from services.firstrun import firstrun
firstrun_thread = firstrun()     
firstrun_thread.onStart()

from services.start import start
ntpdupdate_thread = start()     
ntpdupdate_thread.onStart()

#import services.scheduler

#from services.restart import restart
#ntpdupdate_thread = restart()     
#ntpdupdate_thread.onStart()

