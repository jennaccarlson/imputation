# Sample Code for Imputation

Jenna C. Carlson
University of Pittsburgh
Copyright 2023, University of Pittsburgh, all rights reserve
Shield: [![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg

## Sample Imputation Code

This repository contains example code for imputation from "The extent to which augmenting extant reference panels with population-specific sequences improves imputation quality in Samoans." The purpose of this repository is to provide guidance on performing in-house imputation to other researchers.

This example is given for chromosome 21 and contains code only. The data used in the manuscript are available at the links below.            
  Whole-genome sequencing (WGS) data for reference panel:         
    unphased [dbGaP phs000972.v5.p1](https://www.ncbi.nlm.nih.gov/projects/gap/cgi-bin/study.cgi?study_id=phs000972.v5.p1)      
    phased was extracted for the same samples from the entire set of freeze 9 samples via the [TOPMed Exchange Area](https://topmed.nhlbi.nih.gov/)         
  Genotyping array data: [dbGaP phs000914.v1.p1](https://www.ncbi.nlm.nih.gov/projects/gap/cgi-bin/study.cgi?study_id=phs000914.v1.p1)        

The steps of imputation are as follows:            
  1. align the genotype data to the reference panel        
  2. phase the genotype array data      
  3. phase the reference panel (skip if starting with phased haplotypes)        
  4. impute genotypes         

The code for these steps are in `01_align_example.sh`, `02_phase_geno_example.sh`, `03_phase_ref_example.sh`, and `04_impute_example.sh`. 

In `01_align_example.sh`, the genotyping array data (starting in PLINK binary files) is aligned with the reference panel using [Genotype Harmonizer](https://bioinformaticshome.com/tools/descriptions/Genotype_harmonizer.html#gsc.tab=0), then converted to VCF format with [PLINK](https://www.cog-genomics.org/plink/) and [bcftools](https://samtools.github.io/bcftools/bcftools.html).

In `02_phase_geno_example.sh`, the genotyping array data is phased with [Eagle](https://alkesgroup.broadinstitute.org/Eagle/). This uses assumes there are 10 processors available for parallel processing (numThreads=10). Depending on the capabilities of a user’s machine, this may need to be adjusted.

In `03_phase_ref_example.sh`, the WGS data (input as an indexed VCF file) is phased with [Eagle](https://alkesgroup.broadinstitute.org/Eagle/). This uses assumes there are 10 processors available for parallel processing (numThreads=10). Depending on the capabilities of a user’s machine, this may need to be adjusted. Skip this step if starting with a set of phased haplotypes as a reference panel.

In `04_impute_example.sh`, starting with the phased reference panel, an m3vcf file is created with [Minimac3](https://genome.sph.umich.edu/wiki/Minimac3) and then genotypes are imputed with [Minimac4](https://genome.sph.umich.edu/wiki/Minimac4). This uses assumes there are 10 processors available for parallel processing (cpus=10). Depending on the capabilities of a user’s machine, this may need to be adjusted.

Note: This example code does not walk through quality control steps on the WGS data for the reference panel. It also does not subset the genotyping array data. For the manuscript mentioned above, the following steps were additionally completed:
  * Internal duplicates were removed from the reference panel. 
  * Reference panel variants were filtered to those with a PASS flag from TOPMed processing.
  * Multiallelic variants were split into separate entries.
  * Chr denotation was harmonized (e.g., all files using 'chr21' or '21' consistently).
  * The genotyping array data was lifted over to hg38 using [LiftOver](https://genome.ucsc.edu/cgi-bin/hgLiftOver).
  * The genotyping array data was subsetted to include only individuals not present in the reference panel WGS data. This step was used to create a fair comparison of imputation performance to other panels.  

## Execution
The shell scripts above can be executed on a data analysis server. It is recommended that they be submitted via grid computing software (SGE or Slurm). This code was run on an internal data analysis cluster via Sun Grid Engine with two 12-core processors, 512 GB memory, and 48 TB storage.
The software referenced above ([PLINK](https://www.cog-genomics.org/plink/), [bcftools](https://samtools.github.io/bcftools/bcftools.html), [Genotype Harmonizer](https://bioinformaticshome.com/tools/descriptions/Genotype_harmonizer.html#gsc.tab=0), [Eagle](https://alkesgroup.broadinstitute.org/Eagle/), [Minimac3](https://genome.sph.umich.edu/wiki/Minimac3), [Minimac4](https://genome.sph.umich.edu/wiki/Minimac4)) must be installed prior to execution. 

## Contact Information
If you have questions or comments, please feel free to contact us.
Jenna C. Carlson: jnc35@pitt.edu
