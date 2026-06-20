#!/bin/bash

conda activate annotation
conda install -c bioconda trnascan-se
conda install -c bioconda star
conda install -c bioconda samtools
conda install -c bioconda agat
conda install -c bioconda gffread
conda install -c bioconda trimmomatic

# # tRNA PREDICTION # #
tRNAscan-SE -E -I -H --detail --thread 50 -o trnascan-se.out -f trnascan-se.tbl -m trnascan-se.log  /PATH/TO/RE_mask/AiptasiaF003_V1.fasta.masked
EukHighConfidenceFilter -i trnascan-se.out -s trnascan-se.tbl -o eukconf -p filt

# # TRIM RNASeq reads # #
INDIR="/path/to/raw_rnaseq"
OUTDIR="/path/to/trimmed_rnaseq"

for file in $INDIR/*_R1.fastq.gz; do 
  base=$(basename $file _R1.fastq.gz)
  trimmomatic PE -threads 32 \
  $INDIR/${base}_R1.fastq.gz \
  $INDIR/${base}_R2.fastq.gz \
  $OUTDIR/${base}_trimmed_1P.fastq.gz $OUTDIR/${base}_trimmed_1U.fastq.gz \
  $OUTDIR/${base}_trimmed_2P.fastq.gz $OUTDIR/${base}_trimmed_2U.fastq.gz \
  ILLUMINACLIP:all_truseq_edited.fasta:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:50
done

# # RNASeq mapping # #
STAR --runThreadN 50 --runMode genomeGenerate --genomeDir Aip_index --genomeFastaFiles /PATH/TO/aip_flye_raw/assembly.fasta --genomeSAindexNbases 10

for i in `ls *1P.fq.gz|sed 's/_1P.fq.gz//g'`; do 
    STAR --runThreadN 50 \
    --genomeDir Aip_index \
    --readFilesIn ${i}_1P.fq.gz ${i}_2P.fq.gz \
    --readFilesCommand "zcat" \
    --outSAMtype  BAM SortedByCoordinate \
    --outSAMstrandField intronMotif \
    --twopassMode Basic \
    --outFileNamePrefix ${i}_ \
    --limitBAMsortRAM 10000000000
done

samtools merge -@ 50 Aip_RNASeqAll.STAR.bam *.sortedByCoord.out.bam


##############################################################

# funannotate 

funannotate train -i /PATH/TO/aip_flye_raw/assembly.fasta -o funannotate_Aip_lRNA -l Aip_RNASeqAll_1.fq -r Aip_RNASeqAll_2.fq --species "Exaiptasia diaphana" --cpus 60 --memory 100G 

funannotate train -i /PATH/TO/aip_flye_raw/assembly.fasta -o funannotate_Aip_lRNA --species "Exaiptasia diaphana" --nanopore_mrna apo_F003_trans_filtered.fastq.gz  --cpus 60 --memory 100G 

funannotate predict -i RE_mask/AiptasiaF003_V1.fasta.masked -s "Exaiptasia diaphna" -o funannotate_Aip_lRNA --name Aip --stringtie Aip_RNASeqAll.Stringtie.gtf --protein_evidence uniprot_Aiptasia.faa --transcript_evidence Aip_RNASeqAll.transcripts.fasta  --organism other --database ./funannotate_DB/ --busco_db metazoa --trnascan tRNA/trnascan_final.out --min_protlen 100 --cpus 60

funannotate update -i funannotate_Aip_lRNA --cpus 60

funannotate species -s aiptasia_sp -a funannotate_Aip_lRNA/predict_results/aiptasia_sp.parameters.json

# # IMPLEMENT tRNA PREDICTION # #

# covert tRNA to gff after removing non-high confident
perl convert_tRNAScanSE_to_gff3.pl --input=filter.out > trna_annotation.gff

# merge gff files
agat_sp_merge_annotations.pl --gff funannotate_Aip_lRNA/update_results/Exaiptasia_diaphna.gff3 --gff trna_annotation.gff --out merged.gff

# export protein sequences to proceed with functional annotation
gffread merged.gff -g /PATH/TO/aip_flye_raw/assembly.fasta -y Aip.prot.fasta

# # CHECK FOR OVERLAPPING GENES # # 
agat_sp_fix_overlaping_genes.pl -f merged.gff -o Aip.gff3

# # VALIDATE GFF3 FILE # # 
gt gff3validator Aip.gff3
