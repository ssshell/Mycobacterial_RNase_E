
"""get upstream Nnt & downstream Nnt at given nt pos"""

import sys


class LoadGenome:
    """load genome sequence"""

    def __init__(self, filename_genome):
        self.filename_genome_ = filename_genome
        self.genome_ = ''

    def get_seq(self):
        sequence = ''
        next(self.filename_genome_)
        for line in self.filename_genome_:
            line = line.rstrip()
            sequence += line
        self.genome_ = sequence


class LoadNtPos:
    """load Nt pos"""

    def __init__(self, filename_nt):
        self.filename_nt_ = filename_nt
        self.nt_= []
        self.nt_strand_ = {}

    def get_nt(self):
        next(self.filename_nt_)
        for line in self.filename_nt_:
            line = line.rstrip().split("\t")
            nt = line[0]
            self.nt_.append(nt)
            if str(line[2]) == 'plus':
                self.nt_strand_[nt] = '+'
            else:
                self.nt_strand_[nt] = '-'


class ExtractSeq:
    """extract target sequence from genome based on annotation"""

    def __init__(self, genome):
        self.genome_ = genome

    def reverse_complement(self, sequence):
        complement = {'A': 'T', 'C': 'G', 'G': 'C', 'T': 'A'}
        return ''.join([complement[base] for base in sequence[::-1]])

    def extract_seq(self, gene, start, end, strand):
        """start and end are 1 based coordinate"""
        if strand == '+':
            result = self.genome_[start - 1 : end]
        else:
            result = self.reverse_complement(self.genome_[start - 1 : end])
        return result


def main():
    f_genome = open(sys.argv[1], 'r')
    target_genome = LoadGenome(f_genome)
    target_genome.get_seq()

    f_nt = open(sys.argv[2], 'r')
    target_nt = LoadNtPos(f_nt)
    target_nt.get_nt()

    extract_seq = ExtractSeq(target_genome.genome_)

    # get N bases upstream and N bases downstream of certain nt, (2N + 1) nt in total
    target_seq_Nupdown = {}
    N = int(sys.argv[3])
    for nt in target_nt.nt_:
        # if int(nt) == 1:
        #     # seq_N = extract_seq.extract_seq(nt, int(len(target_genome.genome_)) - N, int(nt) + N, f_strand)
        #     seq_1 = extract_seq.extract_seq(nt, int(len(target_genome.genome_)) - N + 1, len(target_genome.genome_), target_nt.nt_strand_[nt])
        #     seq_2 = extract_seq.extract_seq(nt, int(nt), int(nt) + N, target_nt.nt_strand_[nt])
        #     seq_N = seq_1 + seq_2
        if int(nt) <= N:
            # seq_N = extract_seq.extract_seq(nt, int(len(target_genome.genome_)) - N, int(nt) + N, f_strand)
            seq_1 = extract_seq.extract_seq(nt, int(len(target_genome.genome_)) - (N - int(nt)) + 1, len(target_genome.genome_), target_nt.nt_strand_[nt])
            seq_2 = extract_seq.extract_seq(nt, 1, int(nt), target_nt.nt_strand_[nt])
            seq_3 = extract_seq.extract_seq(nt, int(nt), int(nt) + N, target_nt.nt_strand_[nt])
            seq_N = seq_1 + seq_2 + seq_3
        else:
            seq_N = extract_seq.extract_seq(nt, int(nt) - N, int(nt) + N, target_nt.nt_strand_[nt])
        target_seq_Nupdown[nt] = seq_N

    for nt in target_seq_Nupdown:
        print('>' + nt + '\n' + target_seq_Nupdown[nt])
        # print("%s\t%s\t%s" % (nt, f_strand, target_seq_Nupdown[nt]))


if __name__ == "__main__":
    main()
