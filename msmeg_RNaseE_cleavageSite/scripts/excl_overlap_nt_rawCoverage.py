import sys


class LoadAnnotation:
    """get complete gene list and remove overlapped nt"""

    def __init__(self, filename_annotation):
        self.annotation_ = filename_annotation
        self.genes_start_ = {}
        self.genes_end_ = {}
        self.genes_strand_ = {}
        self.nt_genes_ = {}
        self.nt_genes_unique_ = {}
        self.nt_genes_unique_strand_ = {}

    def get_annotation(self):
        """load gene annotation and sort by starting position,
        order gene on both strand together by starting position
        to check overlap among genes on the same strand as well as
        different strand"""

        for line in self.annotation_:
            line = line.rstrip().split('\t')
            gene = line[0]
            start = line[1]
            end = line[2]
            strand = line[3]
            self.genes_start_[gene] = int(start)
            self.genes_end_[gene] = int(end)
            self.genes_strand_[gene] = strand

    def get_nt_gene(self):
        for gene, start in self.genes_start_.items():
            for i in range(start, self.genes_end_[gene] + 1):
                if str(i) not in self.nt_genes_.keys():
                    self.nt_genes_[str(i)] = []
                self.nt_genes_[str(i)].append(gene)

    def remove_overlap_nt(self):
        for k_nt, v_nt_genes in self.nt_genes_.items():
            if len(v_nt_genes) == 1:
                self.nt_genes_unique_[k_nt] = v_nt_genes[0]
                self.nt_genes_unique_strand_[k_nt] = self.genes_strand_[v_nt_genes[0]]


class AddGeneToUniqueNt:
    """combine nt table file with gene annotation of each unique nucleotide position"""

    def __init__(self, filename_nt, dict_nt_genes_unique, dict_nt_genes_unique_strand, file_strand):
        self.filename_nt_ = filename_nt
        self.nt_genes_unique_ = dict_nt_genes_unique
        self.nt_genes_unique_strand_ = dict_nt_genes_unique_strand
        self.strand_ = file_strand

    def add_gene_to_nt(self):
        for line in self.filename_nt_:
            line = line.rstrip().split('\t')
            nt = str(line[1])
            if nt in self.nt_genes_unique_.keys():
                if self.nt_genes_unique_strand_[nt] == self.strand_:
                    print(nt + "\t" + self.nt_genes_unique_[nt] + "\t" + "\t".join(str(x) for x in line[2:]))


def main():
    f_annotation = open(sys.argv[1], "r")
    f_nt = open(sys.argv[2], "r")
    if sys.argv[3] == "plus":
        f_strand = '+'
    else:
        f_strand = '-'

    annotation = LoadAnnotation(f_annotation)
    annotation.get_annotation()
    ### check annotation load
    # for gene, start in annotation.genes_start_.items():
    #     print(gene + '\t' + str(start) + '\t' + str(annotation.genes_end_[gene]) + '\t' + annotation.genes_strand_[gene])

    annotation.get_nt_gene()
    # for k, v in annotation.nt_genes_.items():
    #     print(len(v))

    ### update genes annotation without overlapped regions
    ## for genes on the same strand and on different strand
    annotation.remove_overlap_nt()
    # print(len(annotation.nt_genes_unique_))

    ### combine nt file with nt gene annotation without nt in overlapped regions
    nt_genes = AddGeneToUniqueNt(f_nt, annotation.nt_genes_unique_, annotation.nt_genes_unique_strand_, f_strand)
    nt_genes.add_gene_to_nt()


if __name__ == "__main__":
    main()
