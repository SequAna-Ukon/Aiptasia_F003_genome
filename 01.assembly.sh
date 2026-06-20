#!/bin/bash
# Script for genome assembly

# --------------------------------------
# # ENVIRONMENT & INSTALLATION # #

mamba create -c bioconda -n assembly_env flye
mamba activate assembly_env

# -----------------------------------------
# ASSEMBLY # #

flye --nano-raw  Aip_clean.fastq.gz --genome-size 275m --out-dir aip_flye_raw --scaffold

# ------------------------------------------
# # QC OF THE ASSEMBLY # #
mamba activate qc_env

mamba install -c bioconda gfastats
mamba install -c bioconda busco

gfastats /PATH/TO/aip_flye_raw/assembly.fasta

busco -i /PATH/TO/aip_flye_raw/assembly.fastaa -m geno -l eukaryota_odb10 -c 30 -o busco_euk

busco -i /PATH/TO/aip_flye_raw/assembly.fasta -m geno -l metazoa_odb10 -c 30 -o busco_meta

