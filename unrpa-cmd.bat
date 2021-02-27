@echo off
rem This program is unrpa dependent, You should have the Python 3.x installed before you go.
rem ***********************
rem ***********************
rem This program is free, and open-source, shall be redistributed on anything without my permission
rem ***********************
rem ***********************
rem Please execute the command "pip install unrpa" before trying to run this batch file on your computer.
rem batch file written by Insertx2k Dev - @insertplayztw on Twitter!
:main
cls
title UnRPA Commander
echo.
echo *****************************
echo UnRPA Command Line
echo *****************************
echo.
echo Please enter the full path of the file you want to do an UnRPA to.
echo.
echo Paths be like : C:\Users\Insertx2k Dev\Desktop\test.rpa, etc...
echo.
echo If the path contains spaces, please put on " " between the full path line
echo e.g. "C:\Users\Insertx2k Dev\Desktop\test-me.rpa"
echo.
echo Please enter the full path of the file you want to do an UnRPA to.
echo.
set /p path_rpa="Full Path for the RPA file is : "
echo.
echo Specified path is : %path_rpa%
echo.
echo Please enter the full path of the directory you'd like to extract the .rpa archive contents in.
echo.
echo For an example (e.g.) : C:\Users\Insertx2k Dev\Desktop\RPA-TEST\files
echo.
echo The path must redirect to a folder, not to another .rpa archive.
echo.
echo If the full path contains spaces, please put on " " between the full path line
echo e.g. "C:\Users\Insertx2k Dev\Desktop\RPA-TEST\files"
echo.
echo Please enter the full path of the folder you'd like the rpa archive content to be extracted on.
echo.
set /p path_ext="Full path for the extracted data is : "
echo.
echo Given details are : 
echo.
echo Path to the rpa archive is : %path_rpa%
echo Path to the folder where you would like to extract the rpa archive content in is : %path_ext%
echo.
echo Do you wish to processed?
echo.
choice /c YN /N /M "Choose Y for yes, N for no (Closes this window and does nothing) : "
echo.
if %errorlevel% == 1 goto ok_goto_extract
if %errorlevel% == 2 goto not_goto_extract
:ok_goto_extract
echo.
cls
echo.
echo Please wait, extracting the rpa archive %path_rpa% to the folder %path_ext% ...
echo.
echo This shouldn't take so long...
echo.
unrpa -mp %path_ext% %path_rpa%
echo.
echo All pending operations has been successfully completed!
echo.
ping -w 10 localhost >nul
pause >nul
cls
exit
:not_goto_extract
echo.
echo Please wait, exiting...
echo.
ping -w 10 localhost >nul
pause >nul
cls
exit