@echo off

setlocal

rem Define the INI file path
set INIFILE=..\config.ini

rem Read the username from the INI file
for /f "tokens=1,2 delims==" %%a in ('findstr /i "^path=" "%INIFILE%"') do set PATH=%%b

set uwsPath=%PATH%\

"..\uwsc.exe" "%uwsPath%センタログイン.uws"

timeout /t 10 /nobreak

"..\uwsc.exe" ST_001-003-003-001.uws

timeout /t 10 /nobreak

"..\uwsc.exe" "%uwsPath%センタログアウト.uws"

endlocal


