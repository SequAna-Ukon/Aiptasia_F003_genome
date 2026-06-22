# _Exaiptasia diaphana_ (Aiptasia) strain F003 reference genome assembly & annotation

Scripts used for the _Exaiptasia diaphana_ reference genome assembly and annotation as described in the corresponding publication:

**Dörr et al. (2026):** "The genome of the coral model sea anemone Exaiptasia diaphana (Aiptasia) strain F003 ". *GigaByte*. DOI: tbd

Raw gDNA sequencing data and raw RNA-Seq data (Oxford Nanopore long-reads) are deposited under the  NCBI BioProject PRJNA1089063 (https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1089063). This Whole Genome Shotgun project has been deposited at DDBJ/ENA/GenBank under the accession JBWBEE000000000 (https://www.ncbi.nlm.nih.gov/nuccore/JBWBEE000000000). 

## Assembly Scripts
* **01.reads_preprocessing.sh**

ONT reads were preprocessed using [PoreChop](https://github.com/rrwick/Porechop), and quality control was done using [FastQC](https://github.com/s-andrews/FastQC) and [NanoPlot](https://github.com/wdecoster/NanoPlot). 

* **02.assembly.sh**
  
The genome was assembled with [flye](https://github.com/mikolmogorov/Flye) using the clean long reads, and the assembly was assessed using [gfastats](https://github.com/vgl-hub/gfastats) and [BUSCO](https://github.com/metashot/busco). 

* **03.assembly_filtering.sh**
  
The assembly was decontaminated using [BlobToolKit](https://blobtoolkit.genomehubs.org/).

* **04.mitogenome.sh**
 
The mitochondrial genome was assembled into a single contig using [GetOrganelle](https://github.com/Kinggerm/GetOrganelle), while [MITOS](https://github.com/trust2virt/mitos2) was used to obtain de novo annotation of the mitogenomic sequence.


## Annotation Scripts
* **05.repeats.sh**
  
Repeats in the _Exaiptasia diaphana_ genome were identified using [EDTA](https://github.com/oushujun/EDTA) and [RepeatModeler](https://github.com/Dfam-consortium/RepeatModeler) then soft-masked using [RepeatMasker](https://github.com/rmhubley/RepeatMasker).

* **06.structural_annotation.sh**

Structural annotation was done using [funannotate](https://github.com/nextgenusfs/funannotate/tree/master). First, tRNAs were identified using [tRNAscan-SE](https://github.com/UCSC-LoweLab/tRNAscan-SE), which were subsequently filtered for high-confidence tRNAs using EukHighConfidenceFilter implemented in tRNAscan-SE. Second, transcript evidence for the structural annotation was prepared from RNA-Seq ONT data of aposymbiotic F003 anemones. In addition, Illumina RNA-Seq datasets of aposymbiotic Aiptasia groups of larval cells were used. Illumina RNASeq data were trimmed using [Trimmomatic](https://github.com/usadellab/Trimmomatic) and mapped to the _Exaiptasia diaphana_ assembly using [STAR](https://github.com/alexdobin/STAR). The resulting bam files were merged, and strand-specific RNA was extracted from the merged bam file. Using the script [stringtie2utr.py](https://github.com/Gaius-Augustus/BRAKER/blob/utr_from_stringtie/scripts/stringtie2utr.py) from the BRAKER3 suite, untranslated regions (UTRs) were added to the gtf file output by BRAKER3. The high-confidence set of tRNAs was merged with the funannotate structural predictions. Then, the gff3 file was checked for overlapping genes using [AGAT](https://agat.readthedocs.io/en/latest/index.html) and validated using [GenomeTools](https://github.com/genometools/genometools). Finally, [GffRead](https://github.com/gpertea/gffread) was used to extract the predicted protein sequences from the merged file to use in the functional annotation.
  
* **07.functional_annotation.sh**

The predicted genes were annotated using [InterProScan](https://github.com/ebi-pf-team/interproscan), [EggNOG-mapper](https://github.com/eggnogdb/eggnog-mapper), and [Phobius](https://phobius.sbc.su.se/). The respective annotation files were then fed into [funannotate](https://github.com/nextgenusfs/funannotate) with the predicted genes in gff3 file format to synthesize all annotations. The final annotation was assessed using [BUSCO](https://busco.ezlab.org/busco_userguide.html).

## Figures

The folder **/figures/** contains data and references to reproduce plots in Figure 1 in the respective manuscript. Please refer to **/figures/README.md**.

## Supplementary Files
The folder **/Supplementary Files/** contains data and references in Supplementary Files in the respective manuscript. Please refer to **/Supplementary Files/README.md**.


## BUSCO

The folder **/BUSCO/** contains the BUSCO scores for the assembly and annotation of the *Exaiptasia diaphana* genome assembly and annotation available under https://www.ncbi.nlm.nih.gov/datasets/genome/GCA_056151815.1. 




