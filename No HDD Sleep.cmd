@echo off
:start

REM --- Change the drive letter D below to match your HDDs. To add another drive replicate the copy and del lines ---
copy NUL D:\A.txt
del D:\A.txt

TIMEOUT /T 15 /NOBREAK
cls
goto start