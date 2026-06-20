## Manuscript figures

### Figure 1

Cladogram based on a simple species tree generated with the NCBI taxonomy using Common Tree. The ggtree R package was used for visualization based on the Representative species of various genera of Hexacorallia class (see manuscript for corresponding references), commonly used laboratory Aiptasia strains CC7, F003, and H2, GC-proportion square-binned blob plot (horizontal axis = GC content, vertical axis = sequence coverage), BlobToolKit v4.3.0 quality assessment of the *Exaiptasia diaphana* genome assembly, and Repeat content of the Aiptasia strain F003 genome. Run BlobToolKit remotely on the folder **/figures/Aip_BTK/**

```bash
conda create -n btk python=3.9
conda activate btk
pip install blobtoolkit

blobtools view --remote /figures/Aip_BTK/
```

