#!/bin/bash
# ONT reads preprocessing

# ----------------------------------
# # ENVIRONMENTS & WORKDIRECTORY # #
workdir="/PATH/TO/READS"

mamba activate reads_env
mamba install -c bioconda porechop
mamba install -c bioconda fastqc
mamba install -c bioconda multiqc
mamba install -c bioconda NanoPlot

# -------------------------------------
# # ADAPTER REMOVAL USING PORECHOP # #

porechop --input $workdir/ONT_raw_reads.fastq.gz -o ONT_reads_pc.fastq.gz --discard_middle

# ------------------------------------
# # QUALITY CONTROL # #

fastqc -t 8 ONT_reads_pc.fastq.gz
multiqc ONT_reads_pc_fastqc.zip -o multiqc --interactive
NanoPlot -t 10 --fastq ONT_reads_pc.fastq.gz --plots dot --legacy hex --N50
