#!/usr/bin/env python
import os
import subprocess

p = subprocess.Popen(['clipster', '-o', '-n ' + os.environ['BLOCK_INSTANCE']], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
out, err = p.communicate()

clipster_array = out.decode('utf-8').split('\n')

if(len(clipster_array) > 0 and len(clipster_array[-1]) > 0):
    content = clipster_array[-1]

    if(len(content) > 30):
        print(content[:20] + '...' + content[-10:])
    else:
        print(content)
else:
    print("#empty#")

