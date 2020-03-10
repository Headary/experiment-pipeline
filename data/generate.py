
import os
import random

# data<délka>-<šířka>

for i in range(10, 35, 5):
    filename = f'data/data/testdata{i}.csv'
    os.makedirs(os.path.dirname(filename), exist_ok = True)
    file = open(filename, 'w')
    for j in range(100):
        value = i**2 + 10*i*random.random()
        file.write(f'{j};{value}\n')
