import requests
import json

headers = {'Content-Type': 'application/json'}
jsonData = open('data.json').read()
arrObj = json.loads(jsonData)
endpoint = "http://localhost:8000/v1/ikhtisar-statistik"


for obj in arrObj:
	r = requests.post(endpoint, json=obj, headers=headers)
