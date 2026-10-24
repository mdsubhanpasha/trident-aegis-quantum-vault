Write-Host "TRIDENT MASTER DEPLOY - Vijayawada" -ForegroundColor Cyan
pip install -r requirements.txt
Write-Host "Server: http://127.0.0.1:8000/docs" -ForegroundColor Green
py -m uvicorn app:app --reload --port 8000
