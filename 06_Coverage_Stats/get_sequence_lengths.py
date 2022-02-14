#!/usr/bin/env python


# sequence length distribution
# requires Biopython

from Bio import SeqIO

def get_lengths(fasta_in, text_out):

    fp_in = open(fasta_in, "r")
    seqs = list(SeqIO.parse(fp_in,"fasta"))
    fp_in.close()

    fp_out = open(text_out, "w")
    for seq in seqs:
        fp_out.write(seq.id+"\t"+str(len(seq.seq))+"\n")
    fp_out.close()


if __name__ == '__main__':

    import sys

    if len(sys.argv) == 3:
        get_lengths(sys.argv[1], sys.argv[2])
    else:
        print "get_lengths(fasta_in, text_out)"
