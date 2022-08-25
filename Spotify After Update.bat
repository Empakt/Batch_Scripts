@echo off
rem For this script to work have the .dll properly applied
rem in the Spotify folder + make a copy of the GitHub .dll
rem and name it chrome_elf_mod.dll.
rem We need the GitHub .dll copy as it will be replaced
rem during Spotify updates.
rem Now you have 3 files that we are working with:
rem 1. chrome_elf.dll (mod from GitHub)
rem 2. chrome_elf_bak.dll (original file)
rem 3. chrome_elf_mod.dll (copy of the GitHub .dll)

set sp=%APPDATA%\Spotify
set app=Spotify.exe
set autoLaunch=n
FOR /F "usebackq" %%A IN ('%sp%\chrome_elf.dll') DO set size=%%~zA
if %size% LSS 700000 (
	goto areYouSure
) else (
	goto task
)

:areYouSure
echo Modded .dll seems to already be applied, options:
echo y - proceed
echo n - cancel
echo e - open explorer at folder
set /p input="Your pick: "
if %input%==y goto task
if %input%==e start explorer.exe %sp%
exit

:task
tasklist /fi "ImageName eq %app%" /fo csv 2>NUL | find /I "%app%">NUL
if "%ERRORLEVEL%"=="0" (
	taskkill /f /im %app%
	timeout /t 1 /nobreak
	set autoLaunch=y
)
move /y %sp%\chrome_elf.dll %sp%\chrome_elf_bak.dll
copy %sp%\chrome_elf_mod.dll %sp%\chrome_elf.dll
if %autoLaunch%==y start %sp%\Spotify.exe