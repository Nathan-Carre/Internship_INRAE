#!/bin/bash
#SBATCH -J CombineGVCFs
#SBATCH -p unlimitq
#SBATCH --mem=500G
#SBATCH --cpus-per-task=30

module purge

# Load modules
module load devel/python/Python-3.11.1 devel/java/17.0.6
module load bioinfo/GATK/4.2.6.1

cd /work/user/ncarre/Merge

# Combine GVCFs to ensure all IDs are included
gatk --java-options "-Xmx500g -Xms500g" CombineGVCFs \
   -R /work/user/ncarre/RNAVAR/Data/GENOME/Bos_taurus.ARS-UCD1.3.dna.toplevel.fa \
   --variant /work/user/ncarre/Results/variant_calling/SRR21691443/SRR21691443.haplotypecaller.combined.g.vcf.gz\
   --variant /work/user/ncarre/Results/variant_calling/SRR21691444/SRR21691444.haplotypecaller.combined.g.vcf.gz\
   --variant /work/user/ncarre/Results/variant_calling/SRR21691445/SRR21691445.haplotypecaller.combined.g.vcf.gz\
   --variant /work/user/ncarre/Results/variant_calling/SRR21691446/SRR21691446.haplotypecaller.combined.g.vcf.gz\
   --variant /work/user/ncarre/Results/variant_calling/SRR21691447/SRR21691447.haplotypecaller.combined.g.vcf.gz\
   -O combined.g.vcf.gz