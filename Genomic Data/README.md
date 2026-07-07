# Genomic Data

This directory contains the final *Exaiptasia diaphana* strain F003 genome assembly, genome annotation, and assembly quality assessment files.

## Directory structure

### assembly/

| File | Description |
|------|-------------|
| `Aiptasia_F003_V1.fna.gz` | Final genome assembly in FASTA format. |

### annotation/

| File | Description |
|------|-------------|
| `Aiptasia_F003_V1.gff.gz` | Structural genome annotation in GFF3 format, including gene models and genomic features. |
| `Aiptasia_F003_V1.faa.gz` | Predicted protein sequences translated from annotated coding genes. |
| `Aiptasia_F003_V1_CDS.fa.gz` | Coding DNA sequences (CDS) extracted from the annotated genes. |
| `AiptasiaF003_V1_RE.gff.gz` | Genomic coordinates of annotated repetitive elements. |

### BUSCO/

| File | Description |
|------|-------------|
| `short_summary.txt` | Summary of BUSCO completeness scores for the genome assembly. |
| `full_table.tsv` | Complete list of BUSCO genes and their classification (Complete, Fragmented, or Missing). |
| `missing_busco_list.tsv` | List of BUSCO genes not detected in the assembly. |

## License

These files are distributed under the license included in this repository.
