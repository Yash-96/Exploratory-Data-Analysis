#!/usr/bin/env python
"""mapper.py"""

import sys
top_list=['player','said','baseball','team','league','season','game','year','hockey','cuban']
for line in sys.stdin:
	line = line.strip()
	words = line.split()
	for word in words:
		if word in top_list:
			for word1 in words:
				if word1==word:
					continue
				else:
					print ('%s|%s\t%s' % (word,word1, 1))
		else:
			continue
  