@echo off

:: Autosave batch script by: spunky#4088 (Discord)

:: Written for srcon.exe https://github.com/matjam/stationeersrcon/releases By author - (Discord) @matjam#0856 

:: Step 1: append the name and path to your srcon.exe file
:: Step 2: edit 'SaveName' 
:: Step 3: append the name and path to your .json file
:: Step 4: schedule this file to run with Task Scheduler - recommended hourly
start /w C:\scron\srcon.exe save SaveName --config=C:\scron\MyServer.json
timeout 10
exit