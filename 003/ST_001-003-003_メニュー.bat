if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit

"..\uwsc.exe" ST_001-003-003_ÉÅÉjÉÖÅ[.UWS

taskkill /F /IM "..\uwsc.exe"

exit