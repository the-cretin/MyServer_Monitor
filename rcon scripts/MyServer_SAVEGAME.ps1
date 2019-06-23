<#
    Powershell autosave script by: @spunky#4088 (discord)
    Written for srcon.exe https://github.com/matjam/stationeersrcon/releases by: @matjam#0856 (Discord)
#>

# Step 1: append the name and path to your srcon.exe file
# Step 2: edit 'SaveName' 
# Step 3: append the name and path to your .json file
# Step 4: schedule this file to run with Task Scheduler - recommended hourly

# (For Task Scheduler) Program: Powershell.exe Arguments: -ExecutionPolicy Bypass -File c:\srcon\MyServer_SAVEGAME.ps1 -WindowStyle Hidden -NoLogo -NonInteractive

Start-Process -FilePath C:\srcon\srcon.exe -ArgumentList "save SaveName --config=C:\srcon\MyServer.json"
Start-Sleep -s 10