#!/bin/sh

# INPUT: PLINK binary genotyping array data (genotypes_chr21.bed, genotypes_chr21.bim, genotypes_chr21.fam) 
#        and an indexed vcf file of the filtered reference panel WGS data (ref_panel_chr21.vcf.gz)
# OUTPUT: aligned VCF files of genotyping data (genotypes_aligned_chr21.vcf.gz)

GenotypeHarmonizer.sh --input genotypes_chr21 \
					  --inputType PLINK_BED  \
					  --output genotypes_aligned_chr21 \
					  --outputType PLINK_BED \
					  --ref ref_panel_chr21 \
					  --refType VCF \
					  --update-reference-allele \
					  --mafAlign 0.30

plink --bfile genotypes_aligned_chr21 --recode vcf-iid --out genotypes_aligned_chr21
bcftools sort genotypes_aligned_chr21.vcf | bgzip -c > genotypes_aligned_chr21.vcf.gz 

