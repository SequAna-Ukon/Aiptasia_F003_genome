# *Exaiptasia diaphana* (Aiptasia) strain F003 reference genome assembly and annotation

This repository contains the scripts, genome assembly, annotation files, figures, and supplementary material used to generate the *Exaiptasia diaphana* strain F003 reference genome described in:

**Dörr et al. (2026).** *The genome of the coral model sea anemone Exaiptasia diaphana (Aiptasia) strain F003.* **GigaByte**. DOI: *TBD*

## Data availability

Raw genomic DNA and Oxford Nanopore RNA-Seq data are available under NCBI BioProject **PRJNA1089063**:

https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1089063

The genome assembly has been deposited in DDBJ/ENA/GenBank under accession **JBWBEE000000000**:

https://www.ncbi.nlm.nih.gov/nuccore/JBWBEE000000000

## Scripts

### 01.reads_preprocessing.sh

Oxford Nanopore reads were trimmed using **PoreChop** and quality assessed with **FastQC** and **NanoPlot**.

### 02.assembly.sh

The genome was assembled using **Flye** and evaluated with **gfastats** and **BUSCO**.

### 03.assembly_filtering.sh

Contaminant sequences were identified and removed using **BlobToolKit**.

### 04.mitogenome.sh

The mitochondrial genome was assembled using **GetOrganelle** and annotated with **MITOS2**.

### 05.repeats.sh

Repeats were identified using **EDTA** and **RepeatModeler**, then soft-masked with **RepeatMasker**.

### 06.structural_annotation.sh

Structural annotation was performed with **funannotate**, using Oxford Nanopore and Illumina RNA-Seq data as transcript evidence. Additional tools included **tRNAscan-SE**, **STAR**, **BRAKER3**, **AGAT**, **GenomeTools**, and **gffread**.

### 07.functional_annotation.sh

Functional annotation was performed using **InterProScan**, **EggNOG-mapper**, and **Phobius**, and integrated with **funannotate**. The final annotation was evaluated using **BUSCO**.

## Repository contents

### Genomic Data/

Contains the final genome assembly and annotation files:

- `assembly/` – genome assembly (FASTA)
- `annotation/` – GFF3, proteins, CDS, and repeat annotation
- `BUSCO/` – BUSCO assessment results

### figures/

Contains the files used to generate Figure 1 of the manuscript. See `figures/README.md` for details.

### Supplementary Files/

Contains the supplementary tables and figures accompanying the manuscript. See `Supplementary Files/README.md` for details.

## License

This repository is distributed under the terms of the included `LICENSE` file.
