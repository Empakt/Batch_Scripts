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

set /p input="Execute update mod fix? y/n: "
if %input%==y goto task
exit

:task
set sp=%APPDATA%\Spotify
move /y %sp%\chrome_elf.dll %sp%\chrome_elf_bak.dll
copy %sp%\chrome_elf_mod.dll %sp%\chrome_elf.dll

rem Debug timeout line to see how the script executed:
rem TIMEOUT /T 600 /NOBREAK