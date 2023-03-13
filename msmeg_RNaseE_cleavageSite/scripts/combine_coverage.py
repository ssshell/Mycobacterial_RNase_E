
import sys

class LoadCoverage:

    def __init__(self, filename_plus, filename_minus):
        self.filename_plus_ = filename_plus
        self.filename_minus_ = filename_minus
        self.coverage_plus_ = {}
        self.coverage_minus_ = {}
        self.coverage_all_ = {}

    def load_coverage(self, filename, dict_coverage):
        for line in filename:
            line = line.rstrip().split('\t')
            dict_coverage[line[0]] = line[1]

    def merge_coverage(self):
        for k, v in self.coverage_plus_.items():
            if v != 'N/A':
                self.coverage_all_[k] = float(v)
            else:
                self.coverage_all_[k] = float(self.coverage_minus_[k])


def main():
    f_name = sys.argv[1][:sys.argv[1].rfind("_", 0, sys.argv[1].rfind("_fragment"))]
    f_plus = open(sys.argv[1], "r")
    minus = f_name + '_minus' + sys.argv[1][sys.argv[1].rfind("_fragment"):]
    f_minus = open(minus, 'r')
    coverage = LoadCoverage(f_plus, f_minus)
    coverage.load_coverage(coverage.filename_plus_, coverage.coverage_plus_)
    coverage.load_coverage(coverage.filename_minus_, coverage.coverage_minus_)
    coverage.merge_coverage()
    for k, v in coverage.coverage_all_.items():
        print("%s\t%.4f" % (k, v))


if __name__ == "__main__":
    main()
