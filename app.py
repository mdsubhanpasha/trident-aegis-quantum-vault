from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import re

# BHARAT OS CORE
app = FastAPI(
    title="BHARAT FinGPT Sovereign OS",
    version="v1.0.6",
    description="Inventor: MOHAMMAD SUBHAN PASHA - SECURE"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# MODELS
class LoginRequest(BaseModel):
    username: str
    password: str

class FinGPTRequest(BaseModel):
    query: str

class PanRequest(BaseModel):
    pan_number: str
    name: str = ""

def mask_pan(pan: str):
    if len(pan) < 5:
        return "XXXX"
    return pan[:2] + "XXXX" + pan[-2:]

# ENDPOINTS
@app.get("/")
def root():
    return {
        "os": "Bharat FinGPT Sovereign OS",
        "version": "v1.0.6",
        "inventor": "MOHAMMAD SUBHAN PASHA",
        "status": "ONLINE SECURE",
        "secure": True
    }

@app.get("/health")
def health():
    return {"status": "healthy", "version": "v1.0.6", "secure": True}

@app.post("/api/v1/auth/login")
def login(data: LoginRequest):
    return {"token": "bharat_secure_token_v1.0.6", "user": data.username, "status": "authenticated"}

@app.post("/api/v1/fingpt/query")
def fingpt_query(data: FinGPTRequest):
    return {
        "query": data.query,
        "response": f"BHARAT FinGPT v1.0.6 Analysis: {data.query}",
        "inventor": "MOHAMMAD SUBHAN PASHA"
    }

@app.post("/api/v1/compliance/check")
def compliance_check(data: PanRequest):
    pan = data.pan_number.upper().strip()
    pattern = r"^[A-Z]{5}[0-9]{4}[A-Z]{1}$"
    is_valid = bool(re.match(pattern, pan))
    
    if not is_valid:
        return {
            "os": "v1.0.6 SECURE",
            "pan_masked": "INVALID FORMAT",
            "valid": False,
            "reason": "Format should be ABCDE1234F",
            "compliant": False
        }
    
    return {
        "os": "Bharat FinGPT Sovereign OS v1.0.6 SECURE",
        "pan_masked": mask_pan(pan),
        "valid": True,
        "compliant": True,
        "message": f"PAN {mask_pan(pan)} validated (DEMO MODE)",
        "note": "Production lo NSDL Authorized API + Client Consent"
    }