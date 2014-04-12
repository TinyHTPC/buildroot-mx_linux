import xbmc
import xbmcgui
import os

	
from services.firstrun import firstrun
firstrun_thread = firstrun()     
firstrun_thread.onStart()

