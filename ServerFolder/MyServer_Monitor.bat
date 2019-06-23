@echo off
:: Size of window:
mode con: cols=240 lines=30

:: Made for Windows.  Please note: You must disable Dr.Watson Error Reporting for your server application for the crash monitoring to work.  Else it will hang asking you to report the problem to Microsoft.

:: Made by: spunky
:: Feedback: discord - @spunky#4088 email - admin@SteppinStone.net

:: The :init %~f0.lock script was sourced from https://superuser.com/questions/362212/how-can-i-prevent-to-run-same-batch-file-twice-to-allow-only-one-instance by: NimeCloud

::::::::::
:: README:
::::::::::  

:: ------------------------
::  Create & Update Server:
:: ------------------------
::  This server monitor used with a steamcmd script can be used to create and update servers.  The server will check for updates at every reboot.

:: ------------------------
:: Reboots:
:: ------------------------
:: This makes it possible to reboot the server remotely using rcon save/shutdown.  Server will automatically restart.

:: ------------------------
:: Known Issue:
:: ------------------------
:: Stationeers rarely ever crashes but if you want this to be able to automatically restart from a crash you need to disable Dr.Watson Error Reporting (for Windows).

:: ------------------------
:: Instructions: 
:: ------------------------

:: Only edit the configuration variables!

:: Step 1: Set the name and path to your server launcher (batch file)

:: Step 2: Set the path to the folder containing steamcmd.exe

:: Step 3: Set the name and path to your steamcmd script.

:: Step 4: (Optional) create a shortcut to this file and place it in %AppData%\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\
::	This will make the file start automatically when the computer starts.

:::::::::
:: ENJOY!
:::::::::

:config
setlocal enableDelayedExpansion

::::::::::::::::::::::::::::::::::::::::::::::::::::::
::               	CONFIGURATION					::
::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: The name and Path of your launcher | Note: Please give your batch file a unique & recognizable name |
	set _launcher="C:\ServerFolder\MyServer_Launcher.bat"

:: The path to your steam folder
	set _steampath="C:\steamcmd"

:: The name and location of your steam commands script
	set _steamscript="C:\steamcmd\scripts\MyServer.cmd"

::::::::::::::::::::::::::::::::::::::::::::::::::::::
::					  CONFIG END					::
::													::
::				DO NOT EDIT BEYOND HERE				::
::::::::::::::::::::::::::::::::::::::::::::::::::::::
if %ERRORLEVEL%==1 call :error
:init
	set "_started="

2>nul (
	9>"%~f0.lock" (
		set "_started=1"
		call :main %_steampath% %_steamscript% %_launcher%
		endlocal
		goto config
	)
)
if defined _started (
	del "%~f0.lock" >nul 2>nul
) else (
	goto eof
)
exit

:main
	set _title=%~n3 monitor by spunky
title %_title%
cls
echo %_title:"=%
echo.
echo ::CONFIG INFO::
echo.
echo %~3
echo %~1
echo %~2
echo.
timeout 10

cls
echo %_title:"=%
echo.
echo This wait time is just to let all caches to be cleared, RAM to flush, background processes to get some action, etc.  A small wait between reboots is recommended.
echo.
echo Now would be a good time to close this application if you don't want it to restart.
echo.
timeout 30

title %~n0
cls
echo %_title:"=%
echo.
echo Updating game files if necessary, please wait...
echo.
echo (%time%)
cd /d %~f1
start /w steamcmd +runscript "%~dpnx2"
echo.
echo Server is up to date.
echo.
timeout 10

cls
echo %_title:"=%
echo.
echo Starting %~n3 and watching for crashes/restarts...
echo.
echo (%time%)
start "%~nx3" /d %~dp3 /w /min %~dpnx3
timeout 10

cls
echo %_title:"=%
echo.
echo WARNING: %~n3 closed or crashed!
echo.
echo (%time%) Waiting to restart the server...
echo.
timeout 10
exit /b

:error
cls
echo Oops, something went wrong. Please check the configuration and try again.
echo.
echo Process failed: "%~f0" had a bad variable.  This instance will close in 5 seconds.
echo.
timeout 5
exit

:eof
cls
echo Error: a duplicate instance was detected! There can be only one.
echo.
echo Process aborted: "%~f0" is already running.  This instance will close in 5 seconds.
echo.
timeout 5
exit