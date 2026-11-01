@echo off
chcp 65001 >nul
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\publish.ps1"
if %ERRORLEVEL%==0 start "" "https://linkcuty.github.io/"
echo.
echo   按任意键关闭这个窗口 ...
pause >nul
