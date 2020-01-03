#!/usr/bin/env python
"""mapper.py"""

import sys
top_list=['sport','football','woman','game','life','world','year','book','day','time']
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
  