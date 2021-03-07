@echo off
rem ==================================================
rem Temporary Folders Cleaner for Win32
rem Simple Batch Program used to help you clean up all of your temporary folders in just a few clicks!
rem There is no need to install any third-party cleaning software from now!
rem Written in Batch by Insertx2k Dev (There is no need to explain how this works, as this is really easy to know so.)
rem ==================================================
rem May be freely redistributed within anything without my permission.
rem You shall modify this for free and without any restrictions.
rem ==================================================
rem Requires Windows 10 for optimal performance, Windows 7 and newer is strongly recommended, although not needed at all.
rem ==================================================
rem This batch file requires Administrative privileges, so please make sure to run this as Administrator in order for it to function properly.
rem ==================================================
rem Please store this file in %localappdata% and create a shortcut to it in your desktop.
rem While making a shortcut to this file in your desktop directory (e.g. C:\users\myhackingtutorial\desktop\temp_cleaner.bat)
rem Please be sure to enable full screen options, and be sure to enable the option to give Administrator privileges automatically.
rem ==================================================
rem Feel free to experiement with other options as they won't hurm your device at all!
rem Follow me on twitter : @insertplayztw
rem ==================================================
cls
title Temporary Folders Cleaner (Checking for Privileges...)
goto check_elevation

:check_elevation
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorlevel% == 0 (
        echo Success: Administrative permissions confirmed.
		goto main
    ) else (
        echo Failure: In order to delete all Temporary files in your PC completely, I will need to have Administrative Privileges, I can not continue without having them at all.
		echo Press any key to close this window : Activity ended with ERROR 404 : Access is denied
    )

    pause >nul
	exit
:main
cls
cd /d "%userprofile%\Desktop"
title Temporary Folders Cleaner + (Administrator) (Asking for confirmation to do an operation)
echo.
echo _____________________________________________
echo Temporary folders cleaner for Windows 
echo _____________________________________________
echo.
if exist "temp_cleaner_log.log" echo A previous log file from a previous session was detected, contents inside of it will be overwritten as needed.
if not exist "temp_cleaner_log.log" echo There is no previous log file from a previous session was detected, it looks like this batch file will attempt to create one as needed.
echo.
echo Would you like from this tool to save all verbose data that this tool saves into a log file?
echo.
echo This can sometimes be helpful, but not always in case.
echo.
echo Saving verbose data will of course : 
echo 1-Save the current configuration of the tool.
echo 2-Save the output of the current command line interpreter to the log file without showing it to the user of the tool.
echo 3-If there is an existing log file in %userprofile%\Desktop named temp_cleaner_log.log, it will be rewritten as needed.
echo.
echo Would you really like to let this tool save verbose information in %userprofile%\Desktop\temp-cleaner-log.log?
echo.
choice /c YN /N /M "Would you like to save all the output information from this tool in log files? [Y,N] : "
if %errorlevel% == 1 goto save_debugging_information
if %errorlevel% == 2 goto no_debugging_information
:save_debugging_information
echo.
echo This will create a log file (a file that ends with .log) in the Desktop directory of %username%
echo Please wait, creating the file temp-cleaner-log.log in desktop directory of %username%...
echo This shouldn't take so long...
echo.
set verbose_to_log_enabled=true
echo Temporary Folders Cleaner DOS Command Line Program Debugging Log > "%userprofile%\Desktop\temp_cleaner_log.log"
echo =========================================================== >> "%userprofile%\Desktop\temp_cleaner_log.log"
echo Process is elevated (Elevation by User type) >> "%userprofile%\Desktop\temp_cleaner_log.log"
echo Process is running on cmd.exe >> "%userprofile%\Desktop\temp_cleaner_log.log"
echo Windows/System Directory is : %windir% >> "%userprofile%\Desktop\temp_cleaner_log.log"
echo User profile directory is : %userprofile% >> "%userprofile%\Desktop\temp_cleaner_log.log"
echo User desktop directory is : %userprofile%\Desktop >> "%userprofile%\Desktop\temp_cleaner_log.log"
echo List of currently running tasks :  >> "%userprofile%\Desktop\temp_cleaner_log.log"
tasklist >> "%userprofile%\Desktop\temp_cleaner_log.log"
echo Current Date According to System Configuration : %date% >> "%userprofile%\Desktop\temp_cleaner_log.log"
echo Current Time According to System Configuration : %time% >> "%userprofile%\Desktop\temp_cleaner_log.log"
echo Process has started with no errors! >> "%userprofile%\Desktop\temp_cleaner_log.log"
echo =========================================================== >> "%userprofile%\Desktop\temp_cleaner_log.log"
goto main2
:no_debugging_information
echo.
echo Please wait...
set verbose_to_log_enabled=false
goto main2
:main2
cls
if %verbose_to_log_enabled% == true echo User Menu has started successfully! >> "%userprofile%\Desktop\temp_cleaner_log.log"
title Temporary Folders Cleaner + (Administrator)
echo.
echo _____________________________________________
echo Temporary folders cleaner for Windows 
echo _____________________________________________
echo Welcome %username% to Temporary Folders Cleaner for Windows!
echo This tool will help you to clean up all the temporary folders through a few clicks!
echo Please choose something from the list to do : 
echo.
echo 1-Clean %systemdrive% Recycle Bin
echo.
echo 2-Clean Prefetch data (%windir%\prefetch)
echo.
echo 3-Clean D3DSCache files (%localappdata%\D3DSCache)
echo.
echo 4-Clean Temporary directory (Windows temporary directory) (%windir%\Temp)
echo.
echo 5-Clean User Temporary Directory (%username%'s Temporary Data) (%localappdata%\Temp)
echo.
echo 6-Clean Google Chrome Temporary Data, and GPUCache and Code Cache data (Directory = %localappdata%\Google\Chrome\User Data\Default)
echo.
echo 7-Clean Google Chrome Cookies (Files Cookies, and Cookies-Journal in %localappdata%\Google\Chrome\User Data\Default)
echo.
echo 8-Clean Default User Temporary Data (Directory = %systemdrive%\Users\Default\AppData\Local\Temp)
echo.
echo 9-Clean Internet Explorer Cached Data (Directory = %localappdata%\Microsoft\Windows\INetCache)
echo Please keep in mind that cleaning IE Cached data will (of course) slow down your Internet experince, but Will make browsing internet more safe for you.
echo.
echo a-Clean Windows Explorer Thumbnail Cache (Directory = %localappdata%\microsoft\windows\explorer - Thumbcache Files)
echo Please keep in mind that this process will cause 100% Disk Usage on Some Computers with low disk space, and with old slow HDDs.
echo.
echo b-Clean User Clipboard
echo Please keep in mind that this doesn't clean pictures you copy, and doesn't clean select on files you copy or cut
echo.
echo c-Clean Recent Documents List (User Recent Documents List) (Directory = %userprofile%\AppData\Roaming\Microsoft\Windows\Recent)
echo.
echo d-Clean Discord Windows Client Temporary data (incl. GPUCache, and Code Cache, and Session Storage data) (Directory = %userprofile%\AppData\Roaming\discord)
echo.
echo e-Clean GNU Image Manipulation Program TMP data (GIMP's tmp) (Directory = %userprofile%\AppData\Roaming\GIMP\2.10\tmp)
echo.
echo f-Clean Steam App HTML Cache files (incl. GPUCache, Code Cache, excl. Cookies, and Cookies-Journal) (Directory = %userprofile%\AppData\Local\Steam\htmlcache)
echo.
echo g-Clean Windows Update Downloaded Updates (Directory = %windir%\SoftwareDistribution\Download)
echo Please keep in mind that you will have to restart Windows Update Service to commit changes.
echo This process will make updates arrive lately to your computer, and Delivery Optimization might not function properly (If on Windows 10)
echo.
echo h-Clean Windows OS Cached Data (Directory = %localappdata%\Microsoft\Windows\Caches)
echo This might cause problems to your Windows Configuration, and might also cause some problems with Windows Start Menu and Modern Settings UI.
echo.
echo i-Clean Internet Explorer Cookie Data (Directory = %localappdata%\Microsoft\Windows\INetCookies)
echo This will log you out of websites you are logged in with 3rd party accounts.
echo This doesn't clean all IE extensions cookies data
echo.
echo j-Clean Additional IE Cached Data (Directory = %localappdata%\Microsoft\Windows\IECompatCache and %localappdata%\Microsoft\Windows\IECompatUaCache)
echo This may slow down your Internet Explorer experience, and will (of course) slow down apps that rely on it's cache to load their content properly.
echo.
echo k-Clear Internet Explorer Downloads History (Directory = %localappdata%\Microsoft\Windows\IEDownloadHistory)
echo This will make you lose information about the recent data you've downloaded from any IE-based browsers.
echo.
echo l-Clean Windows 10 Action Center Cached Data (Directory = %localappdata%\Microsoft\Windows\ActionCenterCache)
echo Please keep in mind that this may cause some problems to the Windows 10's Action Center If Notifications exist in the Center.
echo.
echo m-Clean Modern UI Applications Cached Data (Directory = %localappdata%\Microsoft\Windows\AppCache)
echo Please keep in mind that this process will (of course) slow down your experience with Modern UI Applications.
echo.
echo n-Clean Windows Store-based Microsoft Edge Cached Data and Cookies (Directory = May vary, depends on the user and installation ID, will open an explorer window when executed)
echo.
echo o-Clean Additional Windows Explorer Thumbnail Cached Data (Directory = %localappdata%\Microsoft\Windows\Explorer\ThumbCacheToDelete)
echo.
echo p-Clean Chromium-based Microsoft Edge Cached data (incl. GPUCache, Code Cache data) (Directory = %localappdata%\Microsoft\Edge\User Data\Default)
echo.
echo q-Clean Chromium-Based Microsoft Edge Cookies data (incl. Cookies-Journal file) (excl. Extensions cookies) (Directory = %localappdata%\Microsoft\Edge\User Data\Default)
echo.
echo r-Clean ROBLOX Game Downloads (Directory = %localappdata%\Roblox\Downloads)
echo.
echo s-Clean Adobe Photoshop Web content cached data (incl. GPUCache, Code Cache, Session Storage data) (Directory = %appdata%\Adobe\Adobe Photoshop 2020\Adobe Photoshop 2020 Settings\web-cache-temp)
echo.
echo t-Clean Sony Vegas 17 Pro Temporary data (Directory = %localappdata%\VEGAS Pro\17.0) (This includes FX Logs in the directory)
echo.
echo u-Clean Rhino 3D Moduling App Cached data (Directory = %localappdata%\McNeel\Rhinoceros\temp)
echo.
echo v-Clean Windows 10's CryptNet Data (Directory = %userprofile%\AppData\LocalLow\Microsoft\CryptnetUrlCache)
echo.
echo w-Clean Python PIP Cached data (Directory = %localappdata%\pip\cache)
echo This may slow down python experience.
echo.
echo x-Empty Windows Workingsets (Requires the user to specify the directory to the RAMMap tool by Sysinternals) (Requires the user to accept the EULA of Sysinternals Software).
echo.
echo y-Clean Google Chrome Extensions Cookies data (Files : Extension Cookies and Extension Cookies-journal in directory : %localappdata%\Google\Chrome\User Data\Default)
echo.
echo z-Clean Windows 10's Activities cache - ConnectedDevicesPlatform Cached data (Directory = %localappdata%\ConnectedDevicesPlatform\*)
echo.
echo 0b-Delete Icon Cache file in User Local Applications Data Directory (Directory of the file : %localappdata%\IconCache.db)
echo.
echo 0x-Clean Memory Dump and log data of Microvirt MEmu Android Emulator application (Directory = %localappdata%\Microvirt)
echo.
echo 0f-Clean MalwareBytes Adware Cleaner Log files (Directory = %systemdrive%\AdwCleaner\Logs) (User must specify the location of such directory when a custom directory is specified)
echo.
echo 0k-Clean the folder PerfLogs in %systemdrive% partition/volume (Directory = %systemdrive%\PerfLogs)
echo.
echo 0l-Delete the folder .cache in %userprofile% that Android devices create in your computer when they are attached to your computer. (Directory = %userprofile%\.cache) (This usually won't help freeing up a lot of disk space, Not more than 5 MBs of total size in most cases)
echo.
echo 0n-Clean Temporary data of Squirrelapp (Formerly known as Discord windows client additional temporary data folder) (Directory = %localappdata%\SquirrelTemp)
echo.
echo 0m-Clean LocalLow Temporary folder data/contents (Directory = %userprofile%\AppData\LocalLow\Temp)
echo.
echo 0d-Clean ElevatedDiagnostics folder in User Local App Data Directory (Directory = %localappdata%\ElevatedDiagnostics) (Only available to Windows 10 Users)
echo.
echo 0p-Clean the folder that contains all Downloaded data from the Internet by VMware Software (Directory = %localappdata%\VMware\vmware-download[random-number])
echo.
echo 1f-Clean BalenaEtcher's Web content temporary data (Directory = %userprofile%\appdata\roaming\balena-etcher) (Incl. Code Cache, GPUCache, Session Storage, Local Storage, blob_storage directories)
echo.
echo 1x-Clean Pyinstaller's bincache temporary data (Directory = %appdata%\pyinstaller)
echo.
echo 2x-Clean Jedi Python additional temporary data (Directory = %localappdata%\Jedi)
echo.
echo 1o-Clean GIMP's (GNU Image Manipulation Program's) Recent Documents list (Directory = %localappdata%\recently-used.xbel)
echo.
echo 1p-Delete the file that tells the tool Low Level Format Tool for Windows that you have accepted it's license agreement (Directory = %localappdata%\llftool.4.40.agreement)
echo.
echo 1q-Clean IdentityNexusIntegration folder contents (Directory = %localappdata%\IdentityNexusIntegration)
echo.
echo 2f-Clean Scrap Mechanic Temporary Workshop icons directory (Directory = %localappdata%\Axolot Games\Scrap Mechanic\Temp\WorkshopIcons)
echo.
echo 2d-Clean ROBLOX Game Verbose Logs (Directory = %localappdata%\Roblox\logs)
echo.
echo 3m-Clean Visual Studio Code (All Versions) Webdata Temporary files (Incl. GPUCache, Code Cache, Cache, Cached Data) (Directory = %userprofile%\AppData\Roaming\Code)
echo.
echo 3w-Clean Visual Studio Code (All Versions) Webdata Cookies files (Incl. Cookies, Cookies-journal files) (Directory = %userprofile%\AppData\Roaming\Code)
echo.
echo 2c-Clean Visual Studio Code (All Versions) Extensions Cached data (Directory = %userprofile%\AppData\Roaming\Code)
echo.
echo 2k-Clean WindowsXPE Folder Temporary data (All Versions) (Contains the directory where the downloaded applications of WinXPE is stored) (Directory = \Win10XPE\Temp) (Requires the user to change the directory of where WinXPE is installed in when necessary).
echo.
echo 0v-Delete the identity file of ServiceHub (Only available to Windows 10 Users) (Directory = C:\Users\Ziad Ahmed\AppData\Local\ServiceHub, salt file)
echo.
echo 0-Close this tool.
echo.
echo Last update for this tool was on : 02-03-2021
echo.
set /p choice="Please choose something from the menu : "
if %choice% == 0 goto done
if %choice% == 1 goto clr_systemdrive_recyclebin
if %choice% == 2 goto clr_prefetch_data
if %choice% == 3 goto clr_d3d_cache_data
if %choice% == 4 goto clr_windir_temp_data
if %choice% == 5 goto clr_usr_temp_data
if %choice% == 6 goto clr_google_chrome_usr_temp_web_gpucache_data
if %choice% == 7 goto clr_google_chrome_cookies_data
if %choice% == 8 goto clr_default_usr_tmp_folder_data
if %choice% == 9 goto clr_inetcache_folder_data
if %choice% == a goto clr_explorer_thumbs_data
if %choice% == b goto clr_usr_clipboard_text
if %choice% == c goto clr_recent_docs_list_data
if %choice% == d goto clr_discord_cached_data
if %choice% == e goto clr_gimp_tmp_data
if %choice% == f goto clr_steam_html_cached_data
if %choice% == g goto clr_wup_downloads_data
if %choice% == h goto clr_win10_cached_data
if %choice% == i goto clr_ie_cookies_data
if %choice% == j goto clr_ie_additional_cached_data
if %choice% == k goto clr_ie_downloads_history_data
if %choice% == l goto clr_win10_action_center_cached_data
if %choice% == m goto clr_appux_additionals_cached_data
if %choice% == n goto clr_edge_msstore_cached_data
if %choice% == o goto clr_winthumbcachetodelete_data
if %choice% == p goto clr_msedge_chromium_cached_data_incl_gpucache
if %choice% == q goto clr_msedge_chromium_cookies_data
if %choice% == r goto clr_rblx_game_downloads_data
if %choice% == s goto clr_adobe_photoshop_webcache_data
if %choice% == t goto clr_vegas_pro_cached_data_incl_logs_data
if %choice% == u goto clr_rhino_3d_moduling_cached_data
if %choice% == v goto clr_win10_cryptnet_db_data
if %choice% == w goto clr_py_pip_cached_data
if %choice% == x goto clr_workingsets_sysinternals_rammap_tool
if %choice% == y goto clr_extension_cookies_google_chrome
if %choice% == z goto clr_win10activitescache_connecteddevplatform_cached_data
if %choice% == 0b goto clr_icon_cache_database_file_local_appdata
if %choice% == 0x goto clr_memu_microvirt_local_appdata_dir
if %choice% == 0f goto clr_malwarebytes_adwarecleaner_temp_logs_dir
if %choice% == 0k goto clr_perflogs_directory_systemdrive_files
if %choice% == 0l goto clr_android_dot_cache_file_dir
if %choice% == 0n goto clr_squirrel_tmp_data_discordapp_winclient_dir
if %choice% == 0m goto clr_locallow_tmp_data_ms_dir
if %choice% == 0d goto clr_elevated_diag_data_localappdata_dir
if %choice% == 0p goto clr_vmware_downloaded_data_dir
if %choice% == 1f goto clr_balenaetcher_web_content_temp_dir
if %choice% == 1x goto clr_pyinstaller_bincache_temp_dir
if %choice% == 2x goto clr_python_jedi_temp_dir_localappdata_dir
if %choice% == 1o goto clr_gimp_recent_docs_list_dir_file
if %choice% == 1p goto clr_llft_license_agreement_conf_file
if %choice% == 1q goto clr_identity_nexus_integration_dir_localappdata_contents
if %choice% == 2f goto clr_scrap_mechanic_workshop_icons_temp_dir
if %choice% == 2d goto clr_rblx_game_verbosed_logged_data_dir
if %choice% == 3m goto clr_visual_studio_code_cached_data_incl_code_cache_gpucache_dir
if %choice% == 3w goto clr_visual_studio_cookies_incl_journal_dir
if %choice% == 2c goto clr_visual_studio_extensions_cached_data_dir
if %choice% == 0v goto clr_salt_file_in_service_hub_dir
if %choice% == 2k goto clr_winxpe_temp_downloaded_data_dir
echo.
echo Your choice "%choice%" is not recognized by the tool, please choose something from the menu and try again.
ping -w 10 localhost >nul
goto main2
:done
cls
title Exiting...
echo.
echo Exiting...
echo.
if %verbose_to_log_enabled% == true echo User has executed the command to close the tool on %time% at %date% >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true echo Command has successfully completed - on %time% at %date% >> "%userprofile%\Desktop\temp_cleaner_log.log"
taskkill /f /im cmd.exe
taskkill /f /im tasklist.exe
cls
exit
:clr_systemdrive_recyclebin
cls
if %verbose_to_log_enabled% == true rmdir /s /q "%systemdrive%\$Recycle.bin" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false rmdir /s /q "%systemdrive%\$Recycle.bin"
cd /d %localappdata%
pause >nul
goto main2
:clr_prefetch_data
cls
cd /d %windir%
if %verbose_to_log_enabled% == true erase /s /f /q prefetch >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q prefetch
pause >nul
goto main2
:clr_d3d_cache_data
cls
cd /d %localappdata%
if %verbose_to_log_enabled% == true erase /s /f /q "D3DSCache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "D3DSCache"
pause >nul
goto main2
:clr_windir_temp_data
cls
cd /d %windir%
if %verbose_to_log_enabled% == true erase /s /f /q "Temp" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "Temp"
pause >nul
goto main2
:clr_usr_temp_data
cls
cd /d %localappdata%
if %verbose_to_log_enabled% == true erase /s /f /q "Temp" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "Temp"
pause >nul
goto main2
:clr_google_chrome_usr_temp_web_gpucache_data
cls
cd /d %localappdata%
cd Google
cd Chrome
cd "User Data"
cd "Default"
if %verbose_to_log_enabled% == true erase /s /f /q "GPUCache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q Cache >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q "Code Cache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "GPUCache"
if %verbose_to_log_enabled% == false erase /s /f /q Cache
if %verbose_to_log_enabled% == false erase /s /f /q "Code Cache"
pause >nul
goto main2
:clr_google_chrome_cookies_data
cls
cd /d %localappdata%
cd Google
cd Chrome
cd "User Data"
cd "Default"
if %verbose_to_log_enabled% == true del /s /q "Cookies" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true del /s /q "Cookies-journal" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false del /s /q "Cookies"
if %verbose_to_log_enabled% == false del /s /q "Cookies-journal"
pause >nul
goto main2
:clr_default_usr_tmp_folder_data
cls
cd /d "%systemdrive%\Users\Default\AppData\Local"
if %verbose_to_log_enabled% == true erase /s /f /q Temp >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q Temp
pause >nul
goto main2
:clr_inetcache_folder_data
cls
cd /d "%localappdata%\Microsoft\Windows"
if %verbose_to_log_enabled% == true erase /s /f /q "INetCache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "INetCache"
pause >nul
goto main2
:clr_explorer_thumbs_data
cls
cd /d %localappdata%
cd microsoft
cd windows
cd explorer
if %verbose_to_log_enabled% == true del /s /q *thumbcache* >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false del /s /q *thumbcache*
cd /d %localappdata%\microsoft\windows\explorer
if %verbose_to_log_enabled% == true del /s /q *thumb* >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false del /s /q *thumb*
pause >nul
goto main2
:clr_usr_clipboard_text
cls
@echo off | clip
if %verbose_to_log_enabled% == true echo User executed the command to clean User Clipboard content >> "%userprofile%\Desktop\temp_cleaner_log.log"
echo Successfully cleaned up User clipboard data.
pause >nul
goto main2
:clr_recent_docs_list_data
cls
cd /d %userprofile%\AppData\Roaming
cd Microsoft
cd Windows
if %verbose_to_log_enabled% == true erase /s /f /q Recent >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q Recent
pause >nul
goto main2
:clr_discord_cached_data
cls
cd /d "%userprofile%\AppData\Roaming\discord"
if %verbose_to_log_enabled% == true erase /s /f /q "Cache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q "Code Cache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q "GPUCache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q "Local Storage" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "Cache"
if %verbose_to_log_enabled% == false erase /s /f /q "Code Cache"
if %verbose_to_log_enabled% == false erase /s /f /q "GPUCache"
if %verbose_to_log_enabled% == false erase /s /f /q "Local Storage"
pause >nul
goto main2
:clr_gimp_tmp_data
cls
cd /d "%userprofile%\AppData\Roaming\GIMP\2.10"
if %verbose_to_log_enabled% == true erase /s /f /q "tmp" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "tmp"
pause >nul
goto main2
:clr_steam_html_cached_data
cls
cd /d "%localappdata%\Steam\htmlcache"
if %verbose_to_log_enabled% == true erase /s /f /q "Cache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q "Code Cache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q "GPUCache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "Cache"
if %verbose_to_log_enabled% == false erase /s /f /q "Code Cache"
if %verbose_to_log_enabled% == false erase /s /f /q "GPUCache"
pause >nul
goto main2
:clr_wup_downloads_data
cls
cd /d "%windir%\SoftwareDistribution"
if %verbose_to_log_enabled% == true del /f /s /q "Download" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false del /f /s /q "Download"
echo.
echo Would you like to restart Windows Update Service to commit changes you did to it?
echo.
choice /c YN /M "Would you like to restart windows update service? [Y,N] : "
if %errorlevel% == 1 goto reset_uwp_service
if %errorlevel% == 2 if %verbose_to_log_enabled% == true echo User has skipped Windows Update Restart. >> "%userprofile%\Desktop\temp_cleaner_log.log"
goto main2
:reset_uwp_service
cls
echo.
echo Please wait, restarting Windows Update Service...
echo.
if %verbose_to_log_enabled% == true echo User has executed the command to restart Windows Update Service. "Download" >> "%userprofile%\Desktop\temp_cleaner_log.log"
net start wuauserv
if %verbose_to_log_enabled% == true echo Successfully executed the command to restart Windows Update Service. "Download" >> "%userprofile%\Desktop\temp_cleaner_log.log"
echo.
echo All pending operations has been successfully completed!
echo.
pause >nul
goto main2
:clr_win10_cached_data
cls
cd /d %localappdata%\Microsoft\Windows
if %verbose_to_log_enabled% == true erase /s /f /q "Caches" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "Caches"
pause >nul
goto main2
:clr_ie_cookies_data
cls
cd /d "%localappdata%\Microsoft\Windows"
if %verbose_to_log_enabled% == true erase /s /f /q "INetCookies" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "INetCookies"
pause >nul
goto main2
:clr_ie_additional_cached_data
cls
cd /d %localappdata%\Microsoft\Windows
if %verbose_to_log_enabled% == true erase /s /f /q "IECompatCache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q "IECompatUaCache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "IECompatCache"
if %verbose_to_log_enabled% == false erase /s /f /q "IECompatUaCache"
pause >nul
goto main2
:clr_ie_downloads_history_data
cls
cd /d %localappdata%\Microsoft\Windows
if %verbose_to_log_enabled% == true erase /s /f /q "IEDownloadHistory" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "IEDownloadHistory"
pause >nul
goto main2
:clr_win10_action_center_cached_data
cls
cd /d "%localappdata%\Microsoft\Windows"
if %verbose_to_log_enabled% == true erase /s /f /q "ActionCenterCache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "ActionCenterCache"
pause >nul
goto main2
:clr_appux_additionals_cached_data
cls
cd /d %localappdata%\Microsoft\Windows
if %verbose_to_log_enabled% == true erase /s /f /q "AppCache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "AppCache"
pause >nul
goto main2
:clr_edge_msstore_cached_data
cls
echo.
echo In order to properly make sure that everything has been successfully cleaned up, We will open up an Explorer.exe window with the directory of Microsoft Edge Cached files.
echo Don't forget to know that if you want to permanently delete a file do Shift + Delete in your keyboard while selecting the files you want to delete.
echo You may use Ctrl + A keyboard shortcut to select all files you want to delete while repeating the permanently delete keyboard shortcut.
echo.
echo The directory opened in Explorer.exe is : %localappdata%\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC - Do not go else than this directory.
echo.
if %verbose_to_log_enabled% == true echo User has executed the command to explorer.exe to go to directory : "%localappdata%\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC" >> "%userprofile%\Desktop\temp_cleaner_log.log"
%windir%\explorer.exe "%localappdata%\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC"
if %verbose_to_log_enabled% == true echo Explorer has ended with error 0 >> "%userprofile%\Desktop\temp_cleaner_log.log"
pause >nul
goto main2
:clr_winthumbcachetodelete_data
cls
cd /d "%localappdata%\Microsoft\Windows\Explorer"
if %verbose_to_log_enabled% == true erase /s /f /q "ThumbCacheToDelete" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "ThumbCacheToDelete"
pause >nul
goto main2
:clr_msedge_chromium_cached_data_incl_gpucache
cls
cd /d "%localappdata%\Microsoft\Edge\User Data\Default"
if %verbose_to_log_enabled% == true erase /s /f /q "GPUCache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q "Cache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q "Code Cache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "GPUCache"
if %verbose_to_log_enabled% == false erase /s /f /q "Cache"
if %verbose_to_log_enabled% == false erase /s /f /q "Code Cache"
pause >nul
goto main2
:clr_msedge_chromium_cookies_data
cls
cd /d "%localappdata%\Microsoft\Edge\User Data\Default"
if %verbose_to_log_enabled% == true del /s /q "Cookies" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true del /s /q "Cookies-journal" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false del /s /q "Cookies"
if %verbose_to_log_enabled% == false del /s /q "Cookies-journal"
pause >nul
goto main2
:clr_rblx_game_downloads_data
cls
cd /d "%localappdata%\Roblox"
if %verbose_to_log_enabled% == true erase /s /f /q "Downloads" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "Downloads"
pause >nul
goto main2
:clr_adobe_photoshop_webcache_data
cls
cd /d "%appdata%\Adobe\Adobe Photoshop 2020\Adobe Photoshop 2020 Settings\web-cache-temp"
if %verbose_to_log_enabled% == true erase /s /f /q "GPUCache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q "Code Cache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true del /s /f /q "Visited Links" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "GPUCache"
if %verbose_to_log_enabled% == false erase /s /f /q "Code Cache"
if %verbose_to_log_enabled% == false del /s /f /q "Visited Links"
pause >nul
goto main2
:clr_vegas_pro_cached_data_incl_logs_data
cls
cd /d "%localappdata%\VEGAS Pro\17.0"
if %verbose_to_log_enabled% == true erase /s /f /q "File Explorer Thumbnails" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q "Device Explorer Thumbnails" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true del /s /f /q "*.autosave.veg.bak" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true del /s /f /q "svfx_Ofx*.log" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "File Explorer Thumbnails"
if %verbose_to_log_enabled% == false erase /s /f /q "Device Explorer Thumbnails"
if %verbose_to_log_enabled% == false del /s /f /q "*.autosave.veg.bak"
if %verbose_to_log_enabled% == false del /s /f /q "svfx_Ofx*.log"
pause >nul
goto main2
:clr_rhino_3d_moduling_cached_data
cls
cd /d "%localappdata%\McNeel\Rhinoceros"
if %verbose_to_log_enabled% == true erase /s /f /q "temp" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "temp"
pause >nul
goto main2
:clr_win10_cryptnet_db_data
cls
cd /d "%userprofile%\AppData\LocalLow\Microsoft"
if %verbose_to_log_enabled% == true erase /s /f /q /A:S "CryptnetUrlCache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q /A:S "CryptnetUrlCache"
pause >nul
goto main2
:clr_py_pip_cached_data
cls
cd /d "%localappdata%\pip"
if %verbose_to_log_enabled% == true erase /s /f /q "cache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "cache"
pause >nul
goto main2
:clr_workingsets_sysinternals_rammap_tool
cls
rem User should specify the directory of Sysinternals RAM Map tool here.
if %verbose_to_log_enabled% == true echo User has executed the command to empty windows workingsets, Running RAMMap.exe by Sysinternals to Execute such command. >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true "D:\Software Repository\RAMMap\RAMMap.exe" -Ew >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false "D:\Software Repository\RAMMap\RAMMap.exe" -Ew
if %verbose_to_log_enabled% == true echo RAMMap.exe - command sent. >> "%userprofile%\Desktop\temp_cleaner_log.log"
echo.
echo Successfully executed the command to empty Workingsets.
echo.
echo Press any key to go back to the main menu.
echo.
pause >nul
goto main2
:clr_extension_cookies_google_chrome
cls
cd /d "%localappdata%\Google\Chrome\User Data\Default"
if %verbose_to_log_enabled% == true del /s /q "Extension Cookies" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true del /s /q "Extension Cookies-journal" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false del /s /q "Extension Cookies"
if %verbose_to_log_enabled% == false del /s /q "Extension Cookies-journal"
pause >nul
goto main2
:clr_win10activitescache_connecteddevplatform_cached_data
cls
cd /d "%localappdata%\ConnectedDevicesPlatform"
if %verbose_to_log_enabled% == true erase /s /f /q "ee2999716b7783e6" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "ee2999716b7783e6"
pause >nul
goto main2
:clr_icon_cache_database_file_local_appdata
cls
cd /d "%localappdata%"
echo.
echo Please delete a file named "IconCache.db"
echo.
echo We just started a new windows explorer window to the directory %localappdata% to let the user delete the Icon Cache database file.
echo Please make sure you have enabled the option to show hidden files in folder options of windows explorer session of current user.
echo.
echo Please make SURE TO NOT TO LEAVE THE CURRENT DIRECTORY THAT THIS TOOL HAS OPENED TO YOU.
echo.
if %verbose_to_log_enabled% == true echo User has executed the command to explorer.exe to open the directory : "%localappdata%" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true "%windir%\explorer.exe" "%localappdata%" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false "%windir%\explorer.exe" "%localappdata%"
pause >nul
goto main2
:clr_memu_microvirt_local_appdata_dir
cls
cd /d "%localappdata%"
if %verbose_to_log_enabled% == true erase /s /f /q "Microvirt" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "Microvirt"
pause >nul
goto main2
:clr_malwarebytes_adwarecleaner_temp_logs_dir
cls
cd /d "%systemdrive%\AdwCleaner"
if %verbose_to_log_enabled% == true erase /s /f /q "Logs" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "Logs"
pause >nul
goto main2
:clr_perflogs_directory_systemdrive_files
cls
%systemdrive%
cd /d \.\
if %verbose_to_log_enabled% == true erase /s /f /q "PerfLogs" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "PerfLogs"
pause >nul
goto main2
:clr_android_dot_cache_file_dir
cls
cd /d "%userprofile%"
if %verbose_to_log_enabled% == true rmdir /s /q ".cache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false rmdir /s /q ".cache"
pause >nul
goto main2
:clr_squirrel_tmp_data_discordapp_winclient_dir
cls
cd /d "%localappdata%"
if %verbose_to_log_enabled% == true erase /s /f /q "SquirrelTemp" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "SquirrelTemp"
pause >nul
goto main2
:clr_locallow_tmp_data_ms_dir
cls
cd /d "%userprofile%\AppData\LocalLow"
if %verbose_to_log_enabled% == true erase /s /f /q "Temp" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "Temp"
pause >nul
goto main2
:clr_elevated_diag_data_localappdata_dir
cls
cd /d "%localappdata%"
if %verbose_to_log_enabled% == true erase /s /f /q "ElevatedDiagnostics" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "ElevatedDiagnostics"
pause >nul
goto main2
:clr_vmware_downloaded_data_dir
cls
cd /d "%localappdata%\VMware"
if %verbose_to_log_enabled% == true erase /s /f /q "vmware-download*" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "vmware-download*"
pause >nul
goto main2
:clr_balenaetcher_web_content_temp_dir
cls
cd /d "%userprofile%\appdata\roaming\balena-etcher"
if %verbose_to_log_enabled% == true erase /s /f /q "blob_storage" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "blob_storage"
if %verbose_to_log_enabled% == true erase /s /f /q "Code Cache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "Code Cache"
if %verbose_to_log_enabled% == true erase /s /f /q "GPUCache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "GPUCache"
if %verbose_to_log_enabled% == true erase /s /f /q "Local Storage" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "Local Storage"
if %verbose_to_log_enabled% == true erase /s /f /q "Session Storage" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "Session Storage"
pause >nul
goto main2
:clr_pyinstaller_bincache_temp_dir
cls
cd /d "%appdata%"
cd /d "%userprofile%\AppData\Roaming"
if %verbose_to_log_enabled% == true erase /s /f /q "pyinstaller" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "pyinstaller"
pause >nul
goto main2
:clr_python_jedi_temp_dir_localappdata_dir
cls
cd /d "%localappdata%"
if %verbose_to_log_enabled% == true erase /s /f /q "Jedi" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true echo Python 3.x Might not function properly when deleting such directory. >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "Jedi"
pause >nul
goto main2
:clr_gimp_recent_docs_list_dir_file
cls
cd /d "%localappdata%"
if %verbose_to_log_enabled% == true del /s /q "recently-used.xbel" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true echo User may need to restart GIMP if it is still running in the background >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false echo User may need to restart GIMP if it is still running in the background
if %verbose_to_log_enabled% == false del /s /q "recently-used.xbel"
pause >nul
goto main2
:clr_llft_license_agreement_conf_file
cls
cd /d "%localappdata%"
if %verbose_to_log_enabled% == true del /s /q "llftool.*.agreement" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true echo User may need to restart HDD Low Level Format Tool for the changes to take effect >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false del /s /q "llftool.*.agreement"
if %verbose_to_log_enabled% == false echo User may need to restart HDD Low Level Format Tool for the changes to take effect
pause >nul
goto main2
:clr_identity_nexus_integration_dir_localappdata_contents
cls
cd /d "%localappdata%"
if %verbose_to_log_enabled% == true erase /s /f /q "IdentityNexusIntegration" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true echo This operation might slow down some applications who are dependent on this folder. >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "IdentityNexusIntegration"
if %verbose_to_log_enabled% == false echo This operation might slow down some applications who are dependent on this folder.
pause >nul
goto main2
:clr_scrap_mechanic_workshop_icons_temp_dir
cls
cd /d "%localappdata%\Axolot Games"
cd "Scrap Mechanic"
cd "Temp"
if %verbose_to_log_enabled% == true erase /s /f /q "WorkshopIcons" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true echo The game will take longer than usual to load workshop Thumbnails >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "WorkshopIcons"
if %verbose_to_log_enabled% == false echo The game will take longer than usual to load workshop Thumbnails
pause >nul
goto main2
:clr_rblx_game_verbosed_logged_data_dir
cls
cd /d "%localappdata%\Roblox"
if %verbose_to_log_enabled% == true erase /s /f /q "logs" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true echo ROBLOX Game might not remember your settings when erased it's logged data >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "logs"
if %verbose_to_log_enabled% == false echo ROBLOX Game might not remember your settings when erased it's logged data
pause >nul
goto main2
:clr_visual_studio_code_cached_data_incl_code_cache_gpucache_dir
cls
cd /d "%userprofile%\AppData\Roaming\Code"
if %verbose_to_log_enabled% == true erase /s /f /q "GPUCache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q "Code Cache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q "CachedData" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q "Cache" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "GPUCache"
if %verbose_to_log_enabled% == false erase /s /f /q "Code Cache"
if %verbose_to_log_enabled% == false erase /s /f /q "CachedData"
if %verbose_to_log_enabled% == false erase /s /f /q "Cache"
pause >nul
goto main2
:clr_visual_studio_cookies_incl_journal_dir
cls
cd /d "%userprofile%\AppData\Roaming\Code"
if %verbose_to_log_enabled% == true del /s /q "Cookies" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true del /s /q "Cookies-journal" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false del /s /q "Cookies"
if %verbose_to_log_enabled% == false del /s /q "Cookies-journal"
pause >nul
goto main2
:clr_visual_studio_extensions_cached_data_dir
cls
cd /d "%userprofile%\AppData\Roaming\Code"
if %verbose_to_log_enabled% == true erase /s /f /q "CachedExtensions" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true erase /s /f /q "CachedExtensionVSIXs" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "CachedExtensions"
if %verbose_to_log_enabled% == false erase /s /f /q "CachedExtensionVSIXs"
pause >nul
goto main2
:clr_salt_file_in_service_hub_dir
cls
cd /d "%localappdata%"
if %verbose_to_log_enabled% == true erase /s /f /q "ServiceHub" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true echo Some of Windows 10 features that depend on the Windows 10's new service hub might not function as intended >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == false erase /s /f /q "ServiceHub"
if %verbose_to_log_enabled% == false echo Some of Windows 10 features that depend on the Windows 10's new service hub might not function as intended
pause >nul
goto main2
:clr_winxpe_temp_downloaded_data_dir
cls
rem User must specify the full directory of where WinXPE is completely installed in before they go with this process to avoid corruptions to the file system.
rem Commented by Insertx2k Dev on 07-03-2021
rem May be freely redistributed within anything without my permission.
if %verbose_to_log_enabled% == true erase /s /f /q "D:\Win10XPE\Temp" >> "%userprofile%\Desktop\temp_cleaner_log.log"
if %verbose_to_log_enabled% == true echo You will need to redownload the previously downloaded data for the program WinXPE to finish the export phase of your project properly.
if %verbose_to_log_enabled% == false erase /s /f /q "D:\Win10XPE\Temp"
if %verbose_to_log_enabled% == false echo You will need to redownload the previously downloaded data for the program WinXPE to finish the export phase of your project properly.
echo.
pause >nul
goto main2