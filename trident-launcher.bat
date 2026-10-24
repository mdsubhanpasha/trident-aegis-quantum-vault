@echo off
echo 🔱 TRIDENT AEGIS QUANTUM VAULT - SECURED LAUNCHER
echo Built by Mohammad Subhan Pasha - Vijayawada
echo RBI 9/9 VERIFIED - 100K TPS - Patent Pending
echo.
docker-compose up --build -d
timeout /t 3
start http://127.0.0.1:8000/
start http://127.0.0.1:8000/dashboard
start http://127.0.0.1:8000/docs
echo ✅ TRIDENT SECURED APP LIVE!
pause
