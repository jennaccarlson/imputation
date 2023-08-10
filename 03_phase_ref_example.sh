#!/bin/sh

# INPUT: an indexed vcf file of the filtered reference panel WGS data (ref_panel_chr21.vcf.gz)
#        (Note: requires the genetic_map_hg38_withX.txt.gz file downloaded with Eagle)
# OUTPUT: phased reference panel data (ref_panel_phased_chr21.vcf.gz)

eagle --vcf=ref_panel_chr21.vcf.gz \
	--geneticMapFile=genetic_map_hg38_withX.txt.gz\
	--chrom=21 \
	--outPrefix=ref_panel_phased_chr21 \
	--numThreads=10
