// https://developer.valvesoftware.com/wiki/SteamCMD#Creating_a_script
//
@ShutdownOnFailedCommand 1 //set to 0 if updating multiple servers at once
@NoPromptForPassword 1
login anonymous
force_install_dir C:\ServerFolder
app_update 600760 validate
//use this next line instead if you rather have the beta branch
//app_update 600760 -beta beta validate
quit