#!/usr/bin/python

import pygal
import csv

data_file = 'data/browser-usage.data'

years = []
browser_names = []
browser_usage = dict()
with open(data_file, 'rb') as csvfile:
	r = csv.DictReader( csvfile, skipinitialspace = True )
	browser_names = r.fieldnames[1:]
	for row in r:
		years.append( row['Year'] )
		for browser in browser_names:
			if browser in browser_usage:
				browser_usage[browser].append( float(row[browser]) )
			else:
				browser_usage[browser] = [ float(row[browser]) ]

stackedline_chart = pygal.StackedLine(fill=True)
stackedline_chart.title = 'Browser usage evolution (in %)'
stackedline_chart.x_labels = years
for browser in browser_names:
	stackedline_chart.add(browser, browser_usage[browser])
print stackedline_chart.render()
