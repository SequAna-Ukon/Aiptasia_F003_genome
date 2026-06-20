#!/bin/bash

gfastats /PATH/TO/aip_flye_raw/assembly.fasta -o gfa > Aip.contigs.gfa


mamba activate assem_env
mamba install GetOrganelle

get_organelle_config.py --add  animal_mt

get_organelle_from_assembly.py -F animal_mt -g  /PATH/TO/Aip.contigs.gfa -o animal_mt_out
