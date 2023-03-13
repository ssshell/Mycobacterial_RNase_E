
# Get sum of normalized_1 reads coverage within certain range for given coverage file
# to get coverage from 1 to 3 in coverage_file:
# python sum_coverage.py coverage_file 1 3

import sys

class BaseCoverage:
    """load coverage file (read coverage per coordinate)"""

    def __init__(self, filename):
        self.filename_ = filename
        self.coverage_ = {}

    def get_coverage(self):
        for line in self.filename_:
            line = line.rstrip().split('\t')
            self.coverage_[int(line[1])] = float(line[2])


class SumCoverage:
    """sum the coverage start through end"""

    def __init__(self, coverage, start, end):
        self.coverage_ = coverage
        self.start_ = start
        self.end_ = end
        self.sum_ = 0

    def get_sum(self):
        for position in range(self.start_, self.end_ + 1):
            self.sum_ += self.coverage_[position]


def main():
    f_name = sys.argv[1][:sys.argv[1].rfind("_", 0, sys.argv[1].rfind("_fragment"))]
    f_coverage = open(sys.argv[1], "r")
    coverage = BaseCoverage(f_coverage)
    coverage.get_coverage()
    sum = SumCoverage(coverage.coverage_, int(sys.argv[2]), int(sys.argv[3]))
    # print(coverage.coverage_)
    sum.get_sum()
    print("%s\t%f" % (f_name, sum.sum_))


if __name__ == "__main__":
    main()
