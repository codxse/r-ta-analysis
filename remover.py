import re

file = open('data.js', 'r')
lines = file.readlines()
file.close()

file = open('data.js', 'w')
for line in lines:
    if line[0] != '>':
        file.write(line)
file.close()

with open('data.js', 'r') as fin:
    data = fin.read().splitlines(True)
with open('data.js', 'w') as fout:
    fout.writelines(data[1:])
