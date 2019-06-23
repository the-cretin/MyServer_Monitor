<#
    Graceful shutdown powershell script by: @spunky#4088 (discord)
    Written for srcon.exe https://github.com/matjam/stationeersrcon/releases by: @matjam#0856 (Discord)
#>

# Step 1: append the servername (for notices)
# Step 2: edit 'SaveName' 
# Step 3: append the name and path to your srcon.exe file
# Step 4: append the name and path to your .json file
# Step 5: schedule this file to run with Task Scheduler - recommended every 8 hours

# (For Task Scheduler) Program: Powershell.exe Arguments: -ExecutionPolicy Bypass -File c:\srcon\MyServer_REBOOT.ps1 -WindowStyle Hidden -NoLogo -NonInteractive

<#--CONFIG--#>

# Set the name of your server for notices
$servername = "My Awesome Server"

# Set the name of your save folder.
$savename = "SaveName"

# Set the name and path to your srcon.exe
$srcon = "C:\srcon\srcon.exe"

# Set the name and path to your .JSON file
$json = " --config=C:\srcon\MyServer.json"

<#--END CONFIG--#>

#Do not edit beyond here.

Start-Process -FilePath $srcon -ArgumentList ("notice `"`<color=#B4B4B4`>`<B`>`<I`>`<SIZE=20`>Thanks for playing on $servername!`</SIZE`>`</I`>`</B`>`</color`>`"" + "$json")
Start-Sleep -m 250
Start-Process -FilePath $srcon -ArgumentList ("notice `"`<color=#FF0000`>Warning: Reboot is immenent!`</color`>`"" + "$json")
Start-Sleep -m 250
Start-Process -FilePath $srcon -ArgumentList ("notice `"`<color=#FF0000`>Shutdown in T-5 Minutes.`</color`>`"" + "$json")
Start-Sleep -s 150
Start-Process -FilePath $srcon -ArgumentList ("notice `"`<color=#3EFF00`>Save in T-2 Minutes.`</color`>`"" + "$json")
Start-Sleep -s 90
for ($x=29; $x -gt 0; $x--){
Start-Process -FilePath $srcon -ArgumentList ("notice `"`<color=#3EFF00`>$x seconds until save!`</color`>`"" + "$json")
Start-Sleep -s 1
}
Start-Sleep -m 250
Start-Process -FilePath $srcon -ArgumentList ("notice `"`<color=#FF0000`>saving game...`</color`>`"" + "$json")
Start-Sleep -m 250
Start-Process -FilePath $srcon -ArgumentList ("save $savename" + "$json")
Start-Sleep -s 10
for ($x=2; $x -gt 0; $x--){
Start-Process -FilePath $srcon -ArgumentList ("notice `"`<color=#3EFF00`>Please log out and wait for the server the restart.`</color`>`"" + "$json")
Start-Sleep -s 10
}
Start-Process -FilePath $srcon -ArgumentList ("shutdown -t 30" + "$json")
