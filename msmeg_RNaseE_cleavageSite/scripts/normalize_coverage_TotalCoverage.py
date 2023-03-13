
import sys


class LoadAnnotation:
    """get complete gene list"""

    def __init__(self, filename_annotation):
        self.annotation_ = filename_annotation
        self.genes_ = []
        self.genes_start_ = {}
        self.genes_end_ = {}
        self.genes_strand_ = {}

    def get_annotation(self):
        for line in self.annotation_:
            line = line.rstrip().split('\t')
            self.genes_.append(line[0])
            self.genes_start_[line[0]] = int(line[1])
            self.genes_end_[line[0]] = int(line[2])
            self.genes_strand_[line[0]] = line[3]


class NormalizedByTotalCoverage:

    def __init__(self, filename_coverage_nt, file_strand, list_genes, dict_start, dict_end, dict_strand):
        self.filename_coverage_nt_ = filename_coverage_nt
        self.coverage_nt_ = {}
        self.genes_nt_norm = {}
        self.strand_ = file_strand
        self.genes_ = list_genes
        self.genes_start_ = dict_start
        self.genes_end_ = dict_end
        self.genes_strand_ = dict_strand
        self.coverage_cds_ = {}
        self.nt_cds_ = {}

    def load_coverage_nt(self):
        for line in self.filename_coverage_nt_:
            line = line.rstrip().split('\t')
            self.coverage_nt_[line[0]] = []
            for i in range(2, len(line)):
                self.coverage_nt_[line[0]].append(float(line[i]) + 1)

    def get_coverage_cds(self):
        for gene in self.genes_:
            if self.genes_strand_[gene] == self.strand_:
                self.coverage_cds_[gene] = [0.]*12
                for pos_i in range(self.genes_start_[gene], self.genes_end_[gene] + 1):
                    if str(pos_i) in self.coverage_nt_.keys():
                        for sample_j in range(len(self.coverage_nt_[str(pos_i)])):
                            self.coverage_cds_[gene][sample_j] += self.coverage_nt_[str(pos_i)][sample_j]

    def get_nt_norm(self):
        for gene in self.genes_:
            if self.genes_strand_[gene] == self.strand_:
                for pos_i in range(self.genes_start_[gene], self.genes_end_[gene] + 1):
                    if str(pos_i) in self.coverage_nt_.keys():
                        self.nt_cds_[str(pos_i)] = gene
                        normalized_coverage_i = []
                        for sample_j in range(len(self.coverage_nt_[str(pos_i)])):
                            normalized_coverage_i_j = self.coverage_nt_[str(pos_i)][sample_j] / self.coverage_cds_[gene][sample_j]
                            normalized_coverage_i.append(normalized_coverage_i_j)
                        self.genes_nt_norm[pos_i] = normalized_coverage_i


def main():
    f_annotation = open(sys.argv[1], "r")
    f_coverage_nt = open(sys.argv[2], "r")

    annotation = LoadAnnotation(f_annotation)
    annotation.get_annotation()

    if sys.argv[3] == "plus":
        f_strand = '+'
    else:
        f_strand = '-'
    # print(f_strand)

    coverage_norm = NormalizedByTotalCoverage(f_coverage_nt, f_strand, annotation.genes_, annotation.genes_start_, annotation.genes_end_, annotation.genes_strand_)
    coverage_norm.load_coverage_nt()
    # print(coverage_norm.coverage_nt_)

    coverage_norm.get_coverage_cds()
    # for k_pos, v_coverage in coverage_norm.coverage_cds_.items():
    #     print(str(k_pos) + "\t" + "\t".join(str(x) for x in v_coverage))

    coverage_norm.get_nt_norm()
    for k_pos, v_coverage in coverage_norm.genes_nt_norm.items():
        print(str(k_pos) + "\t" + coverage_norm.nt_cds_[str(k_pos)] + "\t" + "\t".join(str(x) for x in v_coverage))


if __name__ == "__main__":
    main()
