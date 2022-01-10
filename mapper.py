#!/usr/bin/env python

import sys
import re
import random

for line in sys.stdin:
    line = line.rstrip()
    try:
        id_ext = "".join([line, str(random.randint(10,99))])
    except ValueError as e:
        continue
    print("%s\t%d" % (id_ext, 1))
