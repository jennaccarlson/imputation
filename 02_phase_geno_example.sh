#!/bin/sh

# INPUT: aligned genotyped data from 01_align_example.sh (genotypes_aligned_chr21.vcf.gz)
#        (Note: requires the genetic_map_hg38_withX.txt.gz file downloaded with Eagle)
# OUTPUT: phased genotype data (genotypes_phased_chr21.vcf.gz)

eagle --vcf=genotypes_aligned_chr21.vcf.gz \
	  --geneticMapFile=genetic_map_hg38_withX.txt.gz \
	  --chrom=21 \
	  --outPrefix=genotypes_phased_chr21 \
	  --numThreads=5
