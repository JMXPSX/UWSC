if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit

"uwsc.exe" クイックメニュー.UWS

taskkill /F /IM "uwsc.exe"

exit

