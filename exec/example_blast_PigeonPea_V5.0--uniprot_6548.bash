#!/bin/bash

nice -19 /scratch/ncbi-blast-2.5.0+/bin/blastp \
-query ./unannotated/PigeonPea_V5.0.gene.pep.fasta \
-db uniprot/uniprot-proteome%3AUP000006548.fasta \
-outfmt 13 -out uniprot_6548 \
-num_threads 64

~/bin/fgcz_blastp_post.py \
-f unannotated/PigeonPea_V5.0.gene.pep.fasta \
-p 'uniprot_6548_.+json' \
-y annotated/PigeonPea_V5.0.gene--uniprot_6548.yaml \
> annotated/PigeonPea_V5.0.gene--uniprot_6548.fasta

exit 0

