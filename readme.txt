Hello,

This package should have all you need to get your Stationeers Dedicated Server up and running quick including many instructions and explanations.  If you feel this product could be improved please feel free to fork the repository and send a pull request of find me @spunky#4088 (Discord)

Includes:

~ A Reboot/Crash monitor (Reboots is fine but please note that crash monitoring requires you to manually disable Dr.Watson Error Reporting on Windows for the server or it will hang at asking you if you "wish to report this problem to microsoft".
~ A customized server launcher (designed specifically for the server monitor) with optional examples.
~ A steamcmd script for automatic server creations and automatic server updates (sourced from Valve https://developer.valvesoftware.com/wiki/SteamCMD#Creating_a_script).
~ Batch rcon commands* (plus bonus powershell rcon commands if you prefer that).
~ Basic default.ini
* batch rcon commands requires srcon.exe https://github.com/matjam/stationeersrcon/releases by: @matjam#0856 (Discord)

Instructions for creating a server:

The four (4) files you need to get started are: MyServer_Monitor.bat, MyServer_Launcher.bat, default.ini, and MyServer.cmd.

1. Get steamcmd, and make sure it's up-to-date. If you are using steamcmd for the first time you will need to login manually first to let it self update, once that's done you can go ahead and set this up.

2. Copy the steamcmd script 'MyServer.cmd' to the desired location (recommended C:\steamcmd\scripts) Take note of the location that you pick, you will need it later.

3. Copy the contents of ServerFolder to your server folder. Take note of the location that you pick, you will need it later.

4. Edit the files you just copied, including the steamcmd script.

5. If your router DOES NOT support UPNP then you will need to forward some ports.  27500 UPD (SERVER) 27500 TCP (RCON) 27015 UDP (Steam Port)

6a. If you already have a server and don't need to create one, skip to step 11.
6b. Launch the Server_Monitor.bat. This will create your server.

7. Allow the rocketStation_DedicatedServer.exe application through your firewall.

8. Connect to your game server

9. Connect to rcon with your web browser and save the game.

10. Once you have saved the game shut down the server with the web browser rcon and edit the Launcher to the 'reboot example'.

11. Get srcon.exe (link in the description), edit the provided scripts (in rcon scripts folder), choose if you want the batch OR powershell (not both) and set them to run with Task Scheduler (More Instructions in the files). 

12. (Optional) make a shortcut to MyServer_Monitor.bat and place it in %AppData%\Roaming\Microsoft\Windows\Start Menu\Programs\Startup to make the server launch automatically when the computer boots up.

13. (Optional) Disable Dr.Watson Error Reporting in Windows for the rocketstationDedicatedServer.exe.  https://support.microsoft.com/help/188296/how-to-disable-or-enable-dr-watson-for-windows

Most of the files include easy setup and instructions.

Don't forget to try my Backups Archiver! https://github.com/the-cretin/Stationeers-Backups-Archiver

ENJOY!!!