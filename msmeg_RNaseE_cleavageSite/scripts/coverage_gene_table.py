
import sys
import os
import natsort


class LoadAnnotation:
    """get complete gene list"""

    def __init__(self, filename_annotation):
        self.annotation_ = filename_annotation
        self.genes_ = []

    def get_annotation(self):
        for line in self.annotation_:
            line = line.rstrip().split('\t')
            self.genes_.append(line[0])


class LoadCoverage:
    """load each gene coverage file"""

    def __init__(self, filename):
        self.filename_ = filename
        self.file_coverage_ = {}

    def load_coverage(self):
        for line in self.filename_:
            line = line.rstrip().split('\t')
            self.file_coverage_[line[0]] = float(line[1])


class SortDictionary:
    """add dictionary key and value to a list
    sort based on condition and sample name"""

    def __init__(self, dictname):
        self.dict_ = dictname
        self.dict_key_ = []
        self.dict_key_con = []
        self.dict_key_ekd = []
        self.dict_key_hyp = []
        self.dict_value_ = []

    def sort_sample_key(self):
        for k, v in self.dict_.items():
            if 'con' in k:
                self.dict_key_con.append(k)
            elif 'EKD' in k:
                self.dict_key_ekd.append(k)
            else:
                self.dict_key_hyp.append(k)
            sorted_con = natsort.natsorted(self.dict_key_con)
            sorted_ekd = natsort.natsorted(self.dict_key_ekd)
            sorted_hyp = natsort.natsorted(self.dict_key_hyp)
        self.dict_key_ = [sorted_con, sorted_ekd, sorted_hyp]
        for k in self.dict_key_:
            for sample in k:
                self.dict_value_.append(self.dict_[sample])
        return self.dict_key_


def main():
    # get gene list
    f_annotation = open(sys.argv[1], 'r')
    gene_list = LoadAnnotation(f_annotation)
    gene_list.get_annotation()
    # print(gene_list.genes_)

    # load gene coverage
    coverage_all_sample = {}
    for i in os.listdir("../RNAseq_processing/bowtie2_genome/coverage_CDScombined"):
        if i.endswith('.txt'):
            with open(os.path.join("../RNAseq_processing/bowtie2_genome/coverage_CDScombined", i)) as f:
                i_coverage = LoadCoverage(f)
                i_coverage.load_coverage()
                k = i.split('.')[0]
                coverage_all_sample[k] = i_coverage.file_coverage_
    # print(coverage_all_sample)

    # create sample name list
    coverage_all_sample_sorted = SortDictionary(coverage_all_sample)
    coverage_all_sample_sorted.sort_sample_key()
    # print(coverage_all_sample_sorted.dict_key_)
    sample_name = []
    for k in coverage_all_sample_sorted.dict_key_:
        for sample in k:
            sample_name.append(sample)
    # print(sample_name)

    # convert coverage from sample key dictionary to gene key dictionary
    coverage_all_gene = {}
    for gene in gene_list.genes_:
        coverage_all_gene[gene] = {}

    for k_gene, v_gene in coverage_all_gene.items():
         for k_sample, v_sample in coverage_all_sample.items():
             coverage_all_gene[k_gene][k_sample] = v_sample[k_gene]
    # print(coverage_all_gene)

    # print final gene coverage table
    # print sample name on first row
    print("\t" + "\t".join(str(x) for x in sample_name))

    for k_gene, v_dict in coverage_all_gene.items():
        coverage_gene = SortDictionary(v_dict)
        coverage_gene.sort_sample_key()
        print(k_gene + "\t" + "\t".join(str(x) for x in coverage_gene.dict_value_))


if __name__ == "__main__":
    main()
