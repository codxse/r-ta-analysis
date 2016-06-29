def remover(_DATA):
	file = open(_DATA, 'r')
	lines = file.readlines()
	file.close()

	file = open(_DATA, 'w')
	for line in lines:
	    if line[0] != '>':
	        file.write(line)
	file.close()

	with open(_DATA, 'r') as fin:
	    data = fin.read().splitlines(True)
	with open(_DATA, 'w') as fout:
	    fout.writelines(data[1:])

remover('data.js')
remover('data.json')
