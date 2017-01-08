@echo off

cd %~dp0

set "ToolsDir=.\tools"
set "ToolsDir7Zip=7-Zip"
set "ToolsDirUpx=UPX"
set "ToolsDirResHacker=Resource Hacker"

set "SettingsDir=.\settings"
set "ProgramDir=.\setup"
set "ArchiveFile=.\setup.7z"
set "ProgramName=XXX Installer"

echo:
echo ======================================================================
echo:
echo      SFX Creation Support Tool
echo:
echo                      Copyright (C) 2017 tag. All rights reserved.
echo:
echo ======================================================================
echo:
echo Press any key if you want to create a SFX.
pause > nul
echo:
echo ----------------------------------------------------------------------
echo:
echo Compressing program components...
"%ToolsDir%\%ToolsDir7Zip%\7zr.exe" a "%ArchiveFile%" "%ProgramDir%\*"
echo:
echo ----------------------------------------------------------------------
echo:
echo Converting to SFX...
copy /b "%ToolsDir%\%ToolsDir7Zip%\7zsd_all.sfx" + "%SettingsDir%\config.txt" + "%ArchiveFile%" ".\%ProgramName%.exe"
echo:
echo ----------------------------------------------------------------------
echo:
echo Deleting a Archive File...
del %ArchiveFile%
echo:
echo ----------------------------------------------------------------------
echo:
echo Updating Resource Data about Icon...
"%ToolsDir%\%ToolsDirResHacker%\ResourceHacker.exe" -delete ".\%ProgramName%.exe", ".\%ProgramName%.exe", ICONGROUP,,
if exist "%SettingsDir%\Setup.ico" (
	"%ToolsDir%\%ToolsDirResHacker%\ResourceHacker.exe" -addoverwrite ".\%ProgramName%.exe", ".\%ProgramName%.exe", "%SettingsDir%\Setup.ico",ICONGROUP,MAINICON,0
)
echo Updating Resource Data about VersionInfo...
"%ToolsDir%\%ToolsDirResHacker%\ResourceHacker.exe" -delete ".\%ProgramName%.exe", ".\%ProgramName%.exe", VERSIONINFO,,
::"%ToolsDir%\%ToolsDirResHacker%\ResourceHacker.exe" -addoverwrite ".\%ProgramName%.exe", ".\%ProgramName%.exe", "%SettingsDir%\Resources_VersionInfo.res",,,
echo Updating Resource Data about Manifest...
"%ToolsDir%\%ToolsDirResHacker%\ResourceHacker.exe" -addoverwrite ".\%ProgramName%.exe", ".\%ProgramName%.exe", "%SettingsDir%\Resources_Manifest.res",,,
echo:
echo ----------------------------------------------------------------------
echo:
echo Process is end.
pause > nul
