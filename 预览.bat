@echo off
chcp 65001 >nul
cd /d "%~dp0"
start "" cmd /c "timeout /t 6 >nul & start http://localhost:5173"
npm run dev
echo.
echo   关闭这个窗口就停止本地服务。
pause >nul
