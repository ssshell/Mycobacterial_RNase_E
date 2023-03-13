
import sys

f_seq = open(sys.argv[1], 'r')
f_seq_len = int(sys.argv[2])

def get_nt():
    total_count = 0
    seq_context = {}
    seq_len = f_seq_len + 1
    for i in range(1, seq_len):
        seq_context[i] = {}

    for line in f_seq:
        if line.startswith('>'):
            # print(total_count)
            total_count += 1
        else:
            line = line.rstrip()
            # print(len(line))
            for i in range(1, seq_len):
                # print(line[i - 1])
                seq_context[i][line[i - 1]] = seq_context[i].get(line[i - 1], 0) + 1

    for k_pos, v_count in seq_context.items():
        seq_context_relative = []
        seq_context_relative.append(k_pos)
        for nt in ['A', 'T', 'C', 'G']:
            if nt in v_count.keys():
                seq_context_relative.append(int(v_count[nt]) / total_count)
            else:
                seq_context_relative.append(0)
        print("\t".join(str(x) for x in seq_context_relative))

get_nt()
