#!/bin/bash
#SBATCH -J GenotypeGVCFs
#SBATCH -p unlimitq
#SBATCH --mem=10G

module purge

# Load modules
module load devel/python/Python-3.11.1 devel/java/17.0.6
module load bioinfo/GATK/4.2.6.1

cd /work/user/ncarre/Merge

gatk --java-options "-Xmx500g" GenotypeGVCFs \
   -R /work/user/ncarre/RNAVAR/Data/GENOME/Bos_taurus.ARS-UCD1.3.dna.toplevel.fa \
   -V gendb://my_database_VCF_diversity \
   -O output_diversity.vcf.gz
