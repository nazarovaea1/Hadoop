import sys 
import random
new_list = []
for line in sys.stdin:
    try:
        new_id, count = line.strip().split('\t', 1)
        id = new_id[:18]
        new_list.append(id)
    except ValueError as e:
        continue
for i in range(50):
    print(','.join(new_list[:(random.randint(1,5))]))
