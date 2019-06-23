:: Server Launcher for Server Monitor by: spunky#4088 (Discord)

:: Notes:

:: There are two 'start conditions' to consider.  One is for creating a server, the other is for rebooting a server.  By default I have uncommented the line for server creation.

:: Once the server has been created, login to your server's rcon and make a save file.

:: Once you have a save file, you must use the example for reboot rather then the example for server creation.

:: Instructions:

:: Step 1: put this file in your server folder beside (rocketstation_DedicatedServer.exe).

:: Step 2: append the logFile path, ports, worldtype, worldname, and basedirectory.

:: That is all, do not launch this file manually!  This file will be called with the Server Monitor.

:: Example 1 (for server creation only, not for reboots):

start /w /min /abovenormal rocketstation_DedicatedServer.exe -batchmode -nographics -logFile "C:\ServerFolder\MyServer_log.txt" -gameport=27500 -updateport=27015 -autostart -worldtype=Moon -worldname=SaveName -basedirectory="C:\ServerFolder" -clearallinterval=21474836

:: Example 2 (for reboots only, not for server creation):
:: start /w /min /abovenormal rocketstation_DedicatedServer.exe -batchmode -nographics -logFile "C:\ServerFolder\MyServer_log.txt" -gameport=27500 -updateport=27015 -autostart -loadworld=SaveName -basedirectory="C:\ServerFolder" -clearallinterval=21474836

:: Example 3 (using /affinity tag - recommended for assigning which cpu cores to use)
:: start /w /min /abovenormal /affinity F0 rocketstation_DedicatedServer.exe -batchmode -nographics -logFile "C:\ServerFolder\MyServer_log.txt" -gameport=27500 -updateport=27015 -autostart -loadworld=SaveName -basedirectory="C:\ServerFolder" -clearallinterval=21474836

:: How to calculate affinity masks: https://discordapp.com/channels/276525882049429515/392080751648178188/586694770483789824

cls
echo %~n0 is shutting down. 
timeout 5
exit
