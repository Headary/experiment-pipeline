import pandas as pd
import numpy as np
import locale
import glob
from math import *

# Set to users preferred locale:
locale.setlocale(locale.LC_ALL, '')

tex = open('table.tex', 'w+')
plot = open('plot/plot2.dat', 'w+')
# data<délka>-<šířka>

# ----- Calculating of values -----
def average(data,column):
	sum = data[column].sum()
	count = data[column].count()
	return sum/count

# směrodatná odchylka S
def error(data, column, avg, sigma, delta):
	sums = 0
	for index, row in data.iterrows():
	    sums += (row[column] - avg)**2
	N = float(data[column].count())
	s = np.sqrt(sums/(N*(N-1)))
	u = sqrt((sigma * s)**2 + delta**2)
	return u
	

tex.write('\\toprule\n')
tex.write('\\popit{t}{s} & \\popit{s}{m}\\\\\n')
tex.write('\\midrule\n')

#delka l
for i in range(10, 35, 5):
	data = pd.read_csv(f'data/data/testdata{i}.csv', sep=";", decimal='.', names=['exp','result'])
	avg = average(data, 'result')
	u = error(data, 'result', avg, 4.44, 1)
	tex.write(f'$"{i}"$ & $"({"%.2f" % avg}\\pm{"%.2f" % u})"$\\\\\n')
	plot.write(f'{i} {avg} {u}\n')

tex.write('\\bottomrule\n')
