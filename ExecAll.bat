@echo off
setlocal

rem ##############################
rem 初期設定
setlocal enabledelayedexpansion

rem Define the INI file path
set INIFILE=config.ini

rem Read the username from the INI file
for /f "tokens=1,2 delims==" %%a in ('findstr /i "^path=" "%INIFILE%"') do set PATH=%%b

set dir=%PATH%
set USERNAME=admin
set filename=%~nx0
set exectime=1607
rem ##############################

timeout /t 5 /nobreak

for /f "skip=1 tokens=3" %%s in ('query user %USERNAME%') do %windir%\System32\tscon.exe %%s /dest:console

:chktime

timeout /t 5 /nobreak
set tmptime=%time: =0%
set nowtime=%tmptime:~0,2%%tmptime:~3,2%

if %nowtime% == %exectime% (
    goto batexec
) else (
    goto chktime
)

rem ##############################
rem 一括実行
:batexec

rem call :main ST_001-003-003
rem call :main ST_001-006-006
rem call :main ST_001-007-007

rem \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
rem ペア実行

rem 千葉VTEの削除
rem call :main ST_001-009-009

rem 千葉VTEの復元
rem call :main ST_001-008-008
rem \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

rem call :main ST_001-010-010
rem call :main ST_001-011-011
rem call :main ST_001-012-012
rem call :main ST_001-014-014

rem call :main ST_001-022-022
rem call :main ST_001-023-023
rem call :main ST_001-026-026

rem call :main ST_001-034-034
rem call :main ST_001-035-035

rem call :main ST_001-052-052
rem call :main ST_001-071-071

call :end

goto :eof

rem ##############################
  
rem ##############################
rem 実行メイン部品
:main
set filename=%1%
set execname=%filename:~0,14%
set scenario_id=%filename:~11,3%

rem シナリオ実行
rem echo %filename%
rem echo %scenario_id%
rem echo %dir%\%scenario_id%
rem echo %execname%_クイックラン.bat
rem pause

rem timeout /t 10 /nobreak

pushd "%dir%\%scenario_id%"

call %execname%_クイックラン.bat

popd

goto :eof

rem ##############################

:end
rem Rundll32.exe user32.dll, LockWorkStation
echo finished
pause
exit 0

rem ##############################
rem ユーザーセッションを確認するコマンド
rem query user
rem tsconを手動で実行するコマンド
rem %windir%\System32\tscon.exe RDP-Tcp#103 /dest:console
rem ##############################

endlocal