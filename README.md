# Sample Code for Imputation

Jenna C. Carlson
University of Pittsburgh

## Sample Imputation Code
Copyright 2023, University of Pittsburgh, all rights reserve
Shield: [![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg

This repository contains example code used for imputation from "The extent to which augmenting extant reference panels with population-specific sequences improves imputation quality in Samoans." 

The file `impute_chr21_example.sh` contains example code that takes an indexed vcf file of phased reference haplotypes (e.g., from [TOPMed](https://topmed.nhlbi.nih.gov/)). It first creates an m3vcf files with  [Minimac3](https://genome.sph.umich.edu/wiki/Minimac3) and then imputes with [Minimac4](https://genome.sph.umich.edu/wiki/Minimac4).

## Contact Information
If you have questions or comments, please feel free to contact us.
Jenna C. Carlson: jnc35@pitt.edu
