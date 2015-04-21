@echo off

@setlocal enableextensions
@cd /d "%~dp0"

echo -------------------
echo    Basic Install
echo -------------------

powershell Set-ExecutionPolicy Unrestricted >nul
if not errorlevel 1 goto psok
powershell -h >nul 2>&1
if errorlevel 1 goto nops
echo.
echo Not running as Administrator...
echo.
pause
EXIT

:psok
powershell -File BasicInstall.ps1
pause

echo -------------------
echo   Project Install
echo -------------------

powershell -File InstallProjectApps.ps1
pause
EXIT

:nops
echo.
echo ERROR: Can't find Powershell!
echo.
pause
EXIT