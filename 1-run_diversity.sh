#!/bin/bash
#SBATCH -J GenomicsDBImport
#SBATCH -p unlimitq
#SBATCH --mem=500G
#SBATCH --cpus-per-task=30

module purge

#Load modules
# Need Python3,Java17
module load devel/python/Python-3.11.1 devel/java/17.0.6
#module load bioinfo/GATK/4.4.0.0
module load bioinfo/GATK/4.2.6.1
 
cd /work/user/ncarre/Merge

# For production :
# batch-size = 500 reader-threads 1
# -Xmx500g -Xms500g instead of 4g
# tmp dir create before but not my_database dir

# --sample-name-map test3_ENDOMETRE.sample_map \
# --reader-threads 5 \

gatk --java-options "-Xmx500g -Xms500g -DGATK_STACKTRACE_ON_USER_EXCEPTION=true" \
    GenomicsDBImport \
    --batch-size  50 \
    --reader-threads 5 \
    --genomicsdb-workspace-path /work/user/ncarre/Merge/my_database_VCF_diversity\
    --sample-name-map /work/user/ncarre/Merge/VCF_diversity.sample_map \
    --tmp-dir /work/user/ncarre/Merge/tmp \
    --arguments_file /work/user/ncarre/Merge/arguments.txt \
    --reference /work/user/ncarre/RNAVAR/Data/GENOME/Bos_taurus.ARS-UCD1.3.dna.toplevel.fa