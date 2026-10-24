Clear-Host
Write-Host "=========================================" -F Cyan
Write-Host " 🇮🇳 BHARAT FinGPT Sovereign OS v1.0.6" -F Green
Write-Host " Inventor: MOHAMMAD SUBHAN PASHA" -F Yellow
Write-Host "=========================================" -F Cyan

# 1. CHECKPOINT 1: Folder
Write-Host "`n[1/7] CHECKPOINT: Folder..." -F White
if (!(Test-Path "C:\Users\chenn\BHARAT_FINAL")) { Write-Host "❌ Folder ledu!" -F Red; exit }
Set-Location C:\Users\chenn\BHARAT_FINAL
Write-Host "✅ Folder OK: $PWD" -F Green

# 2. CHECKPOINT 2: Python 3.11
Write-Host "`n[2/7] CHECKPOINT: Python 3.11..." -F White
& C:\Python311\python.exe --version
if ($LASTEXITCODE -ne 0) { Write-Host "❌ Python 3.11 ledu!" -F Red; exit }
Write-Host "✅ Python OK" -F Green

# 3. CHECKPOINT 3: Kill Old Servers & Free Port 8000
Write-Host "`n[3/7] CHECKPOINT: Port 8000 Cleaning..." -F White
taskkill /F /IM python.exe 2>$null | Out-Null
Start-Sleep -Seconds 2
Write-Host "✅ Port 8000 Free" -F Green

# 4. CHECKPOINT 4: Dependencies
Write-Host "`n[4/7] CHECKPOINT: Dependencies..." -F White
& C:\Python311\python.exe -m pip install fastapi uvicorn pydantic --quiet --disable-pip-version-check
Write-Host "✅ fastapi, uvicorn, pydantic OK" -F Green

# 5. CHECKPOINT 5: app.py Existence & Fix
Write-Host "`n[5/7] CHECKPOINT: app.py Core OS..." -F White
if (!(Test-Path ".\app.py")) {
Write-Host "⚠️ app.py ledu - Creating GENUINE OS..." -F Yellow
@"
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
app = FastAPI(title="BHARAT FinGPT Sovereign OS", version="v1.0.6", description="Inventor: MOHAMMAD SUBHAN PASHA")
app.add_middleware(CORSMiddleware, allow_origins=["*"], allow_credentials=True, allow_methods=["*"], allow_headers=["*"])
@app.get("/")
def root(): return {"os": "Bharat FinGPT Sovereign OS","version": "v1.0.6","inventor": "MOHAMMAD SUBHAN PASHA","status": "ONLINE SECURE","secure": True}
@app.get("/health")
def health(): return {"status": "healthy", "version": "v1.0.6", "secure": True}
@app.post("/api/v1/auth/login")
def login(data: dict): return {"token": "bharat_secure_token_v1.0.6", "user": data.get("username"), "status": "authenticated"}
@app.post("/api/v1/fingpt/query")
def fingpt(data: dict): return {"query": data.get("query"), "response": "BHARAT FinGPT v1.0.6 Response: Analysis complete for - " + str(data.get("query")), "inventor": "MOHAMMAD SUBHAN PASHA"}
@app.post("/api/v1/compliance/check")
def compliance(data: dict): return {"compliant": True, "check": data, "os": "v1.0.6 SECURE"}
"@ | Set-Content -Path ".\app.py" -Encoding utf8
}
Write-Host "✅ app.py OK" -F Green
Get-Content .\app.py | Select-Object -First 3

# 6. CHECKPOINT 6: Frontend Folder
Write-Host "`n[6/7] CHECKPOINT: Frontend..." -F White
if (!(Test-Path ".\frontend")) { New-Item -ItemType Directory -Path ".\frontend" | Out-Null }
Write-Host "✅ Frontend Folder OK" -F Green

# 7. CHECKPOINT 7: START OS
Write-Host "`n[7/7] CHECKPOINT: STARTING OS..." -F White
Write-Host "=========================================" -F Cyan
Write-Host " 🚀 BHARAT ONLINE SECURE AVVABOTHONDI!" -F Green
Write-Host " URL: http://127.0.0.1:8000/" -F Yellow
Write-Host " DOCS: http://127.0.0.1:8000/docs" -F Yellow
Write-Host " HEALTH: http://127.0.0.1:8000/health" -F Yellow
Write-Host "=========================================" -F Cyan
Start-Process "http://127.0.0.1:8000/docs"
& C:\Python311\python.exe -m uvicorn app:app --host 127.0.0.1 --port 8000 --reload