#!/usr/bin/env python3

def read_file_to_array(file_path):
    with open(file_path, 'r') as file:
        lines = [line.strip() for line in file.readlines()]

    return lines

# TODO: find Makefile recursively in the current workdir
file_path = 'Makefile'
my_array = read_file_to_array(file_path)

print(my_array)

