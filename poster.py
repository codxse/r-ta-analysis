import requests
import json

headers = {'Content-Type': 'application/json'}
jsonData = open('data.json').read()
arrObj = json.loads(jsonData)
endpoint = "http://localhost:8000/v1/besar-ekspor-impor"

iter = 0
for obj in arrObj:
	r = requests.post(endpoint, json=obj, headers=headers)
	print("Done! for Obj: " + str(iter))
	iter = iter + 1
