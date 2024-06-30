/work/project/sigenae/Sarah/colocation$ more 1-run_GenomicsDBImport.sh
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
 
cd /work/project/sigenae/Sarah/colocation/

# For production :
# batch-size = 500 reader-threads 1
# -Xmx500g -Xms500g instead of 4g
# tmp dir create before but not my_database dir

# --sample-name-map test3_ENDOMETRE.sample_map \
# --reader-threads 5 \

gatk --java-options "-Xmx500g -Xms500g" \

       GenomicsDBImport \

       --batch-size  50 \

       --reader-threads 5 \

       --genomicsdb-workspace-path my_database_ENDOMETRE \

       --sample-name-map ENDOMETRE.sample_map \

       --tmp-dir tmp \

       --arguments_file  arguments.txt

/work/project/sigenae/Sarah/colocation$ more arguments.txt

-L 1
-L 2
-L 3
-L 4
-L 5
-L 6
-L 7
-L 8
-L 9
-L 10
-L 11
-L 12
-L 13
-L 14
-L 15
-L 16
-L 17
-L 18
-L 19
-L 20
-L 21
-L 22
-L 23
-L 24
-L 25
-L 26 
-L 27
-L 28
-L 29
-L X
-L MT

/work/project/sigenae/Sarah/colocation$ head ENDOMETRE.sample_map

233077070    VCF_ENDO/0233077070.haplotypecaller.combined.g.vcf.gz

233077071    VCF_ENDO/0233077071.haplotypecaller.combined.g.vcf.gz

233077073    VCF_ENDO/0233077073.haplotypecaller.combined.g.vcf.gz

233077074    VCF_ENDO/0233077074.haplotypecaller.combined.g.vcf.gz

233077075    VCF_ENDO/0233077075.haplotypecaller.combined.g.vcf.gz

233077076    VCF_ENDO/0233077076.haplotypecaller.combined.g.vcf.gz

233077077    VCF_ENDO/0233077077.haplotypecaller.combined.g.vcf.gz

233077079    VCF_ENDO/0233077079.haplotypecaller.combined.g.vcf.gz

233077080    VCF_ENDO/0233077080.haplotypecaller.combined.g.vcf.gz

233077081    VCF_ENDO/0233077081.haplotypecaller.combined.g.vcf.gz


/work/project/sigenae/Sarah/colocation$ more 2-run_GenotypeGVCFs_ENDOMETRE.sh

#!/bin/bash
#SBATCH -J GenomicsDBImport
#SBATCH -p unlimitq
#SBATCH --mem=10G

module purge

#Load modules
# Need Python3,Java17
module load devel/python/Python-3.11.1 devel/java/17.0.6
#module load bioinfo/GATK/4.4.0.0
module load module load bioinfo/GATK/4.2.6.1

cd /work/genphyse/genorobust/COLOCATION/RNAVAR/NextflowRNAVAR/ENDOMETRE/MERGE_gVCF

# For production: -Xmx500g 
# For test: -Xmx4g

gatk --java-options "-Xmx4g" GenotypeGVCFs \
   -R /work/genphyse/genorobust/COLOCATION/RNAVAR/NextflowRNAVAR/GENOME/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa \
   -V gendb://my_database \
   -O outputENDOMETRE.vcf.gz