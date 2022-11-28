import sys

from scipy.stats import shapiro

assert len(sys.argv) > 1

print(shapiro(list(map(float, sys.argv[1:]))))