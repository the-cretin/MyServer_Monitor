@echo off
setlocal enableDelayedExpansion

::Graceful shutdown batch script by: spunky#4088 (Discord)

:: Written for srcon.exe https://github.com/matjam/stationeersrcon/releases By author - (Discord) @matjam#0856 

:: Step 1: append the servername (for notices)
:: Step 2: edit 'SaveName' 
:: Step 3: append the name and path to your srcon.exe file
:: Step 4: append the name and path to your .json file
:: Step 5: schedule this file to run with Task Scheduler - recommended every 8 hours

::::::::::::
:: CONFIG ::
::::::::::::

:: Set the name of your server for notices
set _servername="MY AWESOME SERVER"

:: Set the name of your save folder.
set _savename="SaveName"

:: Set the name and path to your srcon.exe
set _srcon="C:\srcon\srcon.exe"

:: Set the name and path to your .JSON file
set _json="C:\srcon\MyServer.json"

::::::::::::
::  DONE  ::
::::::::::::

:: Do not edit beyond here.  Put your server details in the json file.

if %ERRORLEVEL%==1 (call :error) else (call :main %_srcon% %_json% %_servername% %_savename%)

:main

Title Stationeers 'Graceful Shutdown'
cd /d %~dp1
set _config="--config=%~2"
echo %_config:"=%
pause
srcon notice "<color=#B4B4B4><B><I><SIZE=20>Thanks for playing on %~3 </SIZE></I></B></color>" %_config:"=%
timeout 1
srcon notice "<color=#FF0000>Warning: Reboot is immenent.</color>" %_config:"=%
timeout 1
srcon notice "<color=#FF0000>Shutdown in T-5 Minutes.</color>" %_config:"=%
timeout 120
srcon notice "<color=#3EFF00>Save in T-2 Minutes.</color>" %_config:"=%
timeout 105
for /l %%x in (15,-1,1) do (
srcon notice "<color=#3EFF00>%%x seconds until save.</color>" %_config:"=%
timeout 1
)
srcon save %~4 %_config:"=%
srcon notice "<color=#FF0000>Saving Game...</color>" %_config:"=%
timeout 10
for /l %%x in (2,-1,1) do (
srcon notice "<color=#3EFF00>Please log out and wait for the server to restart.</color>" %_config:"=%
timeout 10
)
timeout 1
srcon shutdown %_config:"=% --timeout=30
exit

:error
cls
echo Oops, something went wrong. Please check the configuration and try again.
echo.
echo Process "%~f0" failed: This instance will close in 5 seconds.
echo.
timeout 5
exit