import re

file = open('data.json', 'r')
lines = file.readlines()
file.close()

file = open('data.json', 'w')
for line in lines:
    if line[0] != '>':
        file.write(line)
file.close()

with open('data.json', 'r') as fin:
    data = fin.read().splitlines(True)
with open('data.json', 'w') as fout:
    fout.writelines(data[1:])
