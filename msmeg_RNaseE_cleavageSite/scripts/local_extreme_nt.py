
import sys


class LoadRatio:

    def __init__(self, filename_ratio, ratio_group):
        self.filename_nt_ratio_ = filename_ratio
        self.nt_gene_ = {}
        self.nt_strand_ = {}
        self.nt_ratio_= {}
        self.ratio_group_ = ratio_group

    def get_nt_ratio(self):
        next(self.filename_nt_ratio_)
        for line in self.filename_nt_ratio_:
            line = line.rstrip().split('\t')
            nt = int(line[0])
            self.nt_gene_[nt] = line[1]
            self.nt_strand_[nt] = line[2]
            if self.ratio_group_ == 'Control':
                ratio = float(line[4])
            elif self.ratio_group_ == 'KnockDown':
                ratio = float(line[3])
            self.nt_ratio_[nt] = ratio


class LocalExtreme:

    def __init__(self, dict_nt_ratio, local_range, extreme_direction):
        self.nt_ratio_ = dict_nt_ratio
        self.local_range_ = local_range
        self.extreme_direction_ = extreme_direction
        self.nt_ratio_extreme_ = []

    def get_local_extreme(self):
        nt_ratio_max = []
        for nt, ratio in self.nt_ratio_.items():
            local_nt = []
            local_ratio = {}
            for i in range(-self.local_range_, self.local_range_ + 1):
                # print(nt + i, nt)
                local_nt.append(nt + i)
            # print(local_nt, nt)
            for local_nt_i in local_nt:
                if local_nt_i in self.nt_ratio_.keys():
                    local_ratio[local_nt_i] = self.nt_ratio_[local_nt_i]
            # print(len(local_ratio))
            if self.extreme_direction_ == "max":
                extreme_nt = max(local_ratio, key = local_ratio.get)
            else:
                extreme_nt = min(local_ratio, key = local_ratio.get)
            if extreme_nt == nt:
                self.nt_ratio_extreme_.append(extreme_nt)
        # print(self.nt_ratio_extreme_)


def main():
    f_nt_ratio = open(sys.argv[1], 'r')
    f_nt_ratio_group = sys.argv[2]
    nt_ratio = LoadRatio(f_nt_ratio, f_nt_ratio_group)

    nt_ratio.get_nt_ratio()
    # print(nt_ratio.nt_ratio_)
    # print(len(nt_ratio.nt_ratio_))

    local_range = int(sys.argv[3])
    extreme_direction = sys.argv[4]
    local_extreme = LocalExtreme(nt_ratio.nt_ratio_, local_range, extreme_direction)
    local_extreme.get_local_extreme()
    # print(local_extreme.nt_ratio_extreme_)
    # print(len(local_extreme.nt_ratio_extreme_))

    print("nt_pos" + "\t" + "gene" + "\t" + "strand" + "\t" + "log2_ratio_extreme")
    for nt in local_extreme.nt_ratio_extreme_:
        print(str(nt) +  "\t" + nt_ratio.nt_gene_[nt] + "\t" + nt_ratio.nt_strand_[nt] \
        + "\t" + str(nt_ratio.nt_ratio_[nt]))


if __name__ == "__main__":
    main()
