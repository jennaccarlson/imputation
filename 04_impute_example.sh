#!/bin/sh

# INPUT: an indexed vcf file of phased reference panel haplotypes (ref_panel_phased_chr21.vcf.gz)
#        and an indexed vcf file of phased genotypes (genotypes_phased_chr21.vcf.gz)
# OUTPUT: imputed genotypes and dosages (imputed_chr21.dose.vcf.gz) with corresponding info file (imputed_chr21.info)


# create m3vcf file 
Minimac3-omp --refHaps ref_panel_phased_chr21.vcf.gz \ 
             --processReference \ 
             --cpus 10 \ 
             --prefix ref_panel_phased_chr21 

# perform imputation using phased genotypes for target samples 
minimac4 --refHaps ref_panel_phased_chr21.m3vcf.gz \ 
         --haps genotypes_phased_chr21.vcf.gz \ 
         --prefix imputed_chr21 \ 
         --format GT,DS \ 
         --allTypedSites \ 
         --ChunkLengthMb 100.00 \ 
         --ChunkOverlapMb 5.00 \ 
         --cpus 10 
