
import sys


class LoadAnnotation:
    """get gene length"""

    def __init__(self, filename_annotation):
        self.annotation_ = filename_annotation
        self.cds_length_ = {}

    def get_annotation(self):
        next(self.annotation_)
        for line in self.annotation_:
            line = line.rstrip().split('\t')
            self.cds_length_[line[0]] = int(line[1])


class LoadCoverage:

    def __init__(self, filename_coverage_cds):
        self.filename_coverage_cds_ = filename_coverage_cds
        self.coverage_cds_ = {}

    def load_coverage_cds(self):
        next(self.filename_coverage_cds_)
        for line in self.filename_coverage_cds_:
            line = line.rstrip().split('\t')
            self.coverage_cds_[line[0]] = []
            for i in range(1, len(line)):
                self.coverage_cds_[line[0]].append(float(line[i]))


class AvgNtCoverage:

    def __init__(self, dict_length, dict_coverage_cds):
        self.cds_length_ = dict_length
        self.coverage_cds_ = dict_coverage_cds
        self.avg_nt_coverage_ = {}

    def get_avg_coverage(self):
        for k_cds, v_coverage in self.coverage_cds_.items():
            # print(k_cds, v_coverage)
            avg_nt_coverage = [coverage / self.cds_length_[k_cds] for coverage in v_coverage]
            # print(k_cds, avg_nt_coverage)
            print(str(k_cds) + "\t" + "\t".join(str(x) for x in avg_nt_coverage))


def main():
    f_annotation_length = open(sys.argv[1], "r")
    f_coverage_cds = open(sys.argv[2], "r")

    annotation = LoadAnnotation(f_annotation_length)
    annotation.get_annotation()
    # print(annotation.cds_length_)
    # print(len(annotation.cds_length_))

    coverage_cds = LoadCoverage(f_coverage_cds)
    coverage_cds.load_coverage_cds()
    # print(coverage_cds.coverage_cds_)
    # print(len(coverage_cds.coverage_cds_))

    avg_nt_coverage = AvgNtCoverage(annotation.cds_length_, coverage_cds.coverage_cds_)
    avg_nt_coverage.get_avg_coverage()


if __name__ == "__main__":
    main()
