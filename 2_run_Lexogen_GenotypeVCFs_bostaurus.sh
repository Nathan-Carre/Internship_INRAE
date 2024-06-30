#!/bin/bash
#SBATCH -J GenomicsDBImport
#SBATCH -p unlimitq
#SBATCH --mem=10G

module purge

#Load modules
# Need Python3,Java17
module load devel/python/Python-3.11.1 devel/java/17.0.6
#module load bioinfo/GATK/4.4.0.0
module load bioinfo/GATK/4.2.6.1

cd /work/user/ncarre/Merge

#For production: -Xmx500g 
#For test: -Xmx4g

gatk --java-options "-Xmx500g" GenotypeGVCFs \
   -R /work/user/ncarre/RNAVAR/Data/GENOME/Bos_taurus.ARS-UCD1.3.dna.toplevel.fa \
   -V gendb://my_database_VCF_Lexo \
   -O output_allLexo.vcf.gz