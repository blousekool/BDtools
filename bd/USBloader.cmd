@echo off
powershell -Command "Start-Process powershell.exe -ArgumentList '-ExecutionPolicy','Bypass','-File','E:\backfile\dinstall.ps1' -Verb runAs -WindowStyle Hidden"
