@echo off
:loop
start C:\UNIMESTRE\programas\Topdata.exe
timeout /t 3600 >null
taskkill /f /im "topdata.exe" >nul
echo "reiniciou"
goto loop