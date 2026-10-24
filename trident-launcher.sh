#!/bin/bash
echo "?? TRIDENT AEGIS QUANTUM VAULT - Starting..."
pip install -r requirements.txt
py -m uvicorn app:app --reload --port 8000 --host 0.0.0.0
