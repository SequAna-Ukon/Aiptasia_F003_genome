# Manuscript figures and source data

This README maps the processed data and resources in this repository to the corresponding manuscript figures and panels.

## Figure 1

### Figure 1A — Taxonomic placement of *Exaiptasia diaphana*

Cladogram showing the placement of *Exaiptasia diaphana* among representative hexacorallian taxa.

- **Data source:** NCBI Taxonomy, accessed using NCBI Common Tree.
- **Visualization:** `ggtree` R package

### Figure 1B — Commonly used Aiptasia laboratory strains

Overview of the Aiptasia strains CC7, F003, and H2.

- **Data source:** Strain information and references cited in the manuscript.

### Figure 1C — GC–coverage blob plot

GC-proportion square-binned blob plot of the *Exaiptasia diaphana* F003 genome assembly, with GC content on the horizontal axis and sequence coverage on the vertical axis.

- **Processed data:** [`Aip_BTK/`](./Aip_BTK/)
- **Principal files:** `gc.json`, `coverage_cov.json`, `length.json`, `identifiers.json`, and the `bestsumorder_*.json` taxonomic-assignment files.
- **Software:** BlobToolKit.
- **Corresponding manuscript panel:** Figure 1C.

### Figure 1D — Genome-assembly quality assessment

BlobToolKit assembly-quality visualization summarizing scaffold-length distribution, nucleotide composition, and BUSCO completeness.

- **Processed data:** [`Aip_BTK/`](./Aip_BTK/)
- **Principal files:** `length.json`, `gc.json`, `ncount.json`, `identifiers.json`, `meta.json`, `metazoa_odb10_busco.json`, and `eukaryota_odb10_busco.json`.
- **Software:** BlobToolKit.
- **Corresponding manuscript panel:** Figure 1D.

The BlobToolKit dataset used for Figures 1C and 1D can be opened remotely as follows:

```bash
conda create -n btk python=3.9
conda activate btk
pip install blobtoolkit
blobtools view --remote ./Aip_BTK/
```

### Figure 1E — Repeat content of the F003 genome

Summary of the abundance and classification of repetitive elements identified in the F003 genome assembly.

- **Processed summary:** [`../Supplementary Files/AiptasiaF003Genome_TableS1.docx`](../Supplementary%20Files/AiptasiaF003Genome_TableS1.docx)
- **Repeat annotations:** [`../Genomic Data/annotation/AiptasiaF003_V1_RE.gff.gz`](../Genomic%20Data/annotation/AiptasiaF003_V1_RE.gff.gz)
- **Analysis workflow:** [`../05.repeats.sh`](../05.repeats.sh)
- **Software:** RepeatModeler, EDTA, and RepeatMasker.
- **Corresponding manuscript panel:** Figure 1E.

## Supplementary Figure S1 — Orthologous-group intersections

UpSet plot showing shared and strain-specific orthologous groups identified by OrthoVenn3 for the F003 and CC7 gene sets.

- **Processed plotting data:** [`../Supplementary Files/Supplementary_FigureS1_data.csv`](../Supplementary%20Files/Supplementary_FigureS1_data.csv)
- **Rendered figure:** [`../Supplementary Files/Supplementary Figure S1.png`](../Supplementary%20Files/Supplementary%20Figure%20S1.png)
- **Data fields:** `CC7` and `F003` indicate membership in each intersection, and `count` gives the number of orthologous groups.
- **Corresponding manuscript figure:** Supplementary Figure S1.
