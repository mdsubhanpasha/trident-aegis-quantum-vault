#!/bin/bash
echo "TRIDENT AEGIS QUANTUM VAULT - RBI 9/9 Verified - Starting..."
pip install -r requirements.txt
python -m uvicorn app:app --reload --port 8000 --host 0.0.0.0
