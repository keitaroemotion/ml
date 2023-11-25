#!/usr/bin/env python3

import os
import re

def find_makefile(start_dir='.'):
    for root, dirs, files in os.walk(start_dir):
        if 'Makefile' in files:
            return os.path.join(root, 'Makefile')
    return None

def file_to_list(file_path):
    with open(file_path, 'r') as file:
        lines = [line.strip() for line in file.readlines()]

    return lines

file_path = find_makefile()

instructions = {}
instruction  = []

for line in file_to_list(file_path):
    if re.match( r'.*:\s*$', line):
        instructions[line] = instruction
        instruction = []
    elif re.match( r'^#.*', line):
        instruction.append(re.sub(re.compile(r'#\s'), '', line, count=1))
    else:
        pass

for key, values in instructions.items():
    print("----------------------")
    print(f"{key}")
    for value in values:
        print(f"  {value}")
print("----------------------")
