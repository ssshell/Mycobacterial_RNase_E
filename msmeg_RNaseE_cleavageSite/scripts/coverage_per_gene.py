
import sys
import sum_coverage

class LoadAnnotation:
    """load gene annotations"""

    def __init__(self, filename_annotation):
        self.annotation_ = filename_annotation
        self.genes_ = {}

    def get_annotation(self):
        for line in self.annotation_:
            line = line.rstrip().split('\t')
            value = line[1] + '_' + line[2] + '_' + line[3]
            self.genes_[line[0]] = value


class SumCoverageGene:
    """sum coverage per gene"""

    def __init__(self, filename_coverage, dict_annotation):
        self.filename_coverage_ = filename_coverage
        self.annotation_ = dict_annotation

    def get_sum(self):
        coverage = sum_coverage.BaseCoverage(self.filename_coverage_)
        coverage.get_coverage()
        # get the strand info from file name
        raw_strand = sys.argv[2][sys.argv[2].rfind("_", 0, sys.argv[2].rfind("_fragment")) + 1 : sys.argv[2].rfind("_fragment")]
        if raw_strand == 'plus':
            sample_strand = '+'
        else:
            sample_strand = '-'
        for k, v in self.annotation_.items():
            gene_strand = v.split('_')[2]
            if gene_strand == sample_strand:
                gene_start = int(v.split('_')[0])
                gene_end = int(v.split('_')[1])
                sum = sum_coverage.SumCoverage(coverage.coverage_, gene_start, gene_end)
                sum.get_sum()
                print("%s\t%f" % (k, sum.sum_))
            else:
                print("%s\t%s" % (k, 'N/A'))


def main():
    f_annotation = open(sys.argv[1], 'r')
    f_coverage = open(sys.argv[2], 'r')
    annotation = LoadAnnotation(f_annotation)
    annotation.get_annotation()
    # print(annotation.genes_)
    # print(len(annotation.genes_))
    sum_coverage = SumCoverageGene(f_coverage, annotation.genes_)
    sum_coverage.get_sum()


if __name__ == "__main__":
    main()
