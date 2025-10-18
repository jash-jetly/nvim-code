#!/usr/bin/env python3
import sys, os, requests, json, re

api_key = os.getenv("GEMINI_API_KEY")
if not api_key:
    print("❌ GEMINI_API_KEY not set")
    sys.exit(1)

context = sys.stdin.read()
prompt = " ".join(sys.argv[1:])
full_prompt = f"""Here is the current code:\n\n{context}\n\n{prompt}\n\nReturn the entire updated code inside a Python code block (no explanation)."""

url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent"
headers = {"Content-Type": "application/json"}
params = {"key": api_key}
data = {"contents": [{"parts": [{"text": full_prompt}]}]}

r = requests.post(url, headers=headers, params=params, json=data)
try:
    txt = r.json()['candidates'][0]['content']['parts'][0]['text']
    code = re.findall(r"```(?:\w+)?\n(.*?)```", txt, re.DOTALL)
    print(code[0].strip() if code else txt.strip())
except:
    print("❌ Failed:", json.dumps(r.json(), indent=2))
