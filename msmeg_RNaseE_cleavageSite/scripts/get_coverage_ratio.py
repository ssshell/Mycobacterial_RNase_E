
import sys
import numpy as np


class CoverageRatio:

    def __init__(self, filename_norm_coverage_nt, num_replicate):
        self.filename_norm_coverage_nt_ = filename_norm_coverage_nt
        self.num_replicate_ = num_replicate
        self.coverage_nt_ = {}
        self.coverage_nt_CDS_ = {}
        self.coverage_nt_ratio_ = {}

    def load_coverage_nt(self):
        for line in self.filename_norm_coverage_nt_:
            line = line.rstrip().split('\t')
            self.coverage_nt_[line[0]] = []
            self.coverage_nt_CDS_[line[0]] = line[1]
            for i in range(2, len(line)):
                self.coverage_nt_[line[0]].append(float(line[i]))
            # print(len(self.coverage_nt_[line[0]]))

    def get_log2_ratio(self):
        for pos_k, norm_coverage_v in self.coverage_nt_.items():
            trt = np.mean(norm_coverage_v[: self.num_replicate_])
            ctrl = np.mean(norm_coverage_v[self.num_replicate_: ])
            nt_ratio = np.log2(trt / ctrl)
            self.coverage_nt_ratio_[pos_k] = nt_ratio


def main():
    f_coverage_nt = open(sys.argv[1], "r")

    coverage = CoverageRatio(f_coverage_nt, 3)
    coverage.load_coverage_nt()
    # print(coverage.coverage_nt_)

    coverage.get_log2_ratio()
    # print(len(coverage.ratio_nt_))

    for k_pos, v_ratio in coverage.coverage_nt_ratio_.items():
        print("%s\t%s\t%s" % (k_pos, coverage.coverage_nt_CDS_[k_pos], v_ratio))


if __name__ == "__main__":
    main()
