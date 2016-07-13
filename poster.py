import requests
import json

headers = { 
	'Authorization': 'Bearer DoaIbuBapakLulusKuliah',
	'Content-Type': 'application/json'
}
jsonFile = 'data.json';
jsonData = open(jsonFile).read()
arrObj = json.loads(jsonData)
endpoint = "https://api.kawaljakarta.org/v1/ikhtisar-statistik-antar-kerja"

iter = 0
for obj in arrObj:
	r = requests.post(endpoint, json=obj, headers=headers)
	print("Done! for Obj: " + str(iter))
	iter = iter + 1
