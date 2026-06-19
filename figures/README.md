## Manuscript figures

### Figure 1

Cladogram based on a simple species tree generated with the NCBI ETE v3.1.3 toolkit based on published Hexacorallian genomes (see manuscript for corresponding references).
BlobToolKit v4.3.0 quality assessment of the *Porites harrisoni* genome assembly. Run BlobToolKit remotely on the folder **/figures/Aip_BTK/**

```bash
conda create -n btk python=3.9
conda activate btk
pip install blobtoolkit

blobtools view --remote /figures/PAG_UKon_Phar_BTK/
```

### Figure 5

*Porites harrisoni* mitochondrial genome assembly and annotation based on the mitochondrial genome available through GenBank as a single-contig of the *Porites harrisoni* assembly (https://www.ncbi.nlm.nih.gov/nuccore/JBDLLT000000000).
