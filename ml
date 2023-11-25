#!/usr/bin/env python3

import re

def file_to_list(file_path):
    with open(file_path, 'r') as file:
        lines = [line.strip() for line in file.readlines()]

    return lines

# TODO: find Makefile recursively in the current workdir
file_path = 'test/Makefile'

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
