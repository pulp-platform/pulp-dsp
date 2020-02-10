#!/usr/bin/env python3

print('hello from gen')

import argparse

parser = argparse.ArgumentParser()
args = parser.parse_args()
print(args)